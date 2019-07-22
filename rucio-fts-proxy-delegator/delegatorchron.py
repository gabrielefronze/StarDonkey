import os
import subprocess
import time
from datetime import datetime, timedelta
import calendar
import fts3.rest.client.easy as fts3
import fts3.rest.client.exceptions as fts3exceptions
import json
from shutil import copy2 as cp

month_to_number = {v: k for k,v in enumerate(calendar.month_abbr)}

def voms_proxy_init(args = ''):
    d = dict()

    proc = subprocess.Popen(['/bin/bash'], stdin=subprocess.PIPE, stdout=subprocess.PIPE, shell=True)
    cmd = 'voms-proxy-init '+args
    output = proc.communicate(cmd)[0]
    if len(output)>=4:
        if len(output)==5:
            output = output[1:]
        output_lines = output.splitlines()[1::2]
        proxy_path = output_lines[0].replace("Created proxy in ",'')[:-1]
        proxy_expiration = output_lines[1].replace("Your proxy is valid until ",'')
        proxy_expiration_datetime = datetime.strptime(proxy_expiration.partition(' ')[2].replace('UTC ',''), '%b %d %H:%M:%S %Y')
        proxy_expiration_timestamp = proxy_expiration_datetime.strftime('%s')

        d['path'] = proxy_path
        d['expiration'] = proxy_expiration_datetime
        d['TS'] = proxy_expiration_timestamp

        cp(proxy_path, '/tmp/fts-voms-proxy')

        return d
    else:
        print('FATAL: an error occurred. See below for details:')
        print(output)
        return d


def fts3_delegate(fts3_endpoint = 'https://fts3-devel.cern.ch:8446'):
    proxy = voms_proxy_init()
    if proxy:
        print(proxy['path'])
        print(proxy['expiration'])
        print(proxy['TS'])
    else:
        print("FATAL: proxy creation failed.")
        return

    fts3_context = context = fts3.Context(fts3_endpoint, verify=True)
    whoami = fts3.whoami(fts3_context)

    no_valid_delegation = False
    termination_time = datetime.utcnow()
    elapsed_threshold = timedelta(hours=1)

    try:
        delegation_ID = whoami['delegation_id']
        check_delegation = 'curl -s -E '+proxy['path']+' --cacert '+proxy['path']+' --capath /etc/grid-security/certificates '+fts3_endpoint+'/delegation/'+delegation_ID
        proc_check = subprocess.Popen(check_delegation, shell=True, stdin=subprocess.PIPE, stdout=subprocess.PIPE)
        check_delegation_json = json.loads(proc_check.communicate(check_delegation)[0])

        if check_delegation_json:
            termination_time = datetime.strptime(check_delegation_json['termination_time'].replace('T',' '),'%Y-%m-%d %H:%M:%S')
            print('Valid until {} UTC'.format(termination_time.strftime('%H:%M:%S %Y-%m-%d')))
        else:
            no_valid_delegation = True
    except:
        no_valid_delegation = False

    if (termination_time - elapsed_threshold) < datetime.utcnow() or no_valid_delegation:
        print('Renewing delegation!')
        delegation_ID_2 = fts3.delegate(fts3_context, lifetime=timedelta(hours=12), force=True)
        print('Delegation ID = {}'.format(delegation_ID_2))
    else:
        print('Nothing to do...')

if __name__ == '__main__':
    fts3_delegate()
