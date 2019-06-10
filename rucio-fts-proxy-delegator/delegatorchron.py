import os
import subprocess
import time
from datetime import datetime, timedelta
import calendar
import fts3.rest.client.easy as fts3
import fts3.rest.client.exceptions as fts3exceptions
import json

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

        return d
    else:
        print('FATAL: an error occurred. See below for details:')
        print(output)
        return d


if __name__ == '__main__':
    proxy = voms_proxy_init()
    if proxy:
        print(proxy['path'])
        print(proxy['expiration'])
        print(proxy['TS'])
    else:
        print("FATAL: proxy creation failed.")

    fts3_context = context = fts3.Context('https://fts3-public.cern.ch:8446', verify=True)
    whoami = 'curl -s -E '+proxy['path']+' --cacert '+proxy['path']+' --capath /etc/grid-security/certificates https://fts3-public.cern.ch:8446/whoami'
    proc_whoami = subprocess.Popen(['/bin/bash'], stdin=subprocess.PIPE, stdout=subprocess.PIPE)
    delegation_ID = json.loads(proc_whoami.communicate(whoami)[0])['delegation_id']


    check_delegation = 'curl -s -E '+proxy['path']+' --cacert '+proxy['path']+' --capath /etc/grid-security/certificates https://fts3-public.cern.ch:8446/delegation/'+delegation_ID
    proc_check = subprocess.Popen(['/bin/bash'], stdin=subprocess.PIPE, stdout=subprocess.PIPE)
    check_delegation_json = json.loads(proc_check.communicate(check_delegation)[0])

    no_valid_delegation = False
    termination_time = datetime()

    if check_delegation_json:
        termination_time = datetime.strptime(check_delegation_json['termination_time'].replace('T',' '),'%Y-%m-%d %H:%M:%S')
        print('Valid until {} UTC'.format(termination_time.strftime('%H:%M:%S %Y-%m-%d')))
    else:
        no_valid_delegation = True

    if termination_time < datetime.utcnow() or no_valid_delegation:
        print('Renewing delegation!')
        delegation_ID_2 = fts3.delegate(fts3_context, lifetime=timedelta(hours=12), force=True)
        assert delegation_ID == delegation_ID_2
        print('Delegation ID = {}'.format(delegation_ID))
    else:
        print('Nothing to do...')
