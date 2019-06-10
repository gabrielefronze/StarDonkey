import os
import time
from datetime import datetime, timedelta
import calendar
import fts3.rest.client.easy as fts3
import fts3.rest.client.exceptions as fts3exceptions
import json

month_to_number = {v: k for k,v in enumerate(calendar.month_abbr)}

def voms_proxy_init(args = ''):
    d = dict()

    cmd = 'voms-proxy-init '+args
    output = os.popen(cmd).read()
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
        print("FATAL: proxy creating failed.")

    os.environ["X509_USER_PROXY"] = proxy['path']
    fts3_context = context = fts3.Context('https://fts3-public.cern.ch:8446', verify=True)

    delegation_ID = fts3.delegate(fts3_context, lifetime=timedelta(minutes=2), force=True)
    print('Delegation ID = {}'.format(delegation_ID))

    check_delegation = 'curl -E ${X509_USER_PROXY} --cacert ${X509_USER_PROXY} --capath /etc/grid-security/certificates https://fts3-devel.cern.ch:8446/delegation/'+delegation_ID
    check_delegation_json = json.loads(os.popen(check_delegation).read())
    print('Valid until {}'.format(check_delegation_json['termination_time']))
