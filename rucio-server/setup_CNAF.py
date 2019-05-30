#!/usr/bin/env python
# Copyright 2012-2018 CERN for the benefit of the ATLAS collaboration.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# You may not use this file except in compliance with the License.
# You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
#
# Authors:
# - Thomas Beermann, <thomas.beermann@cern.ch>, 2018
# - Cedric Serfon, <cedric.serfon@cern.ch>, 2018

import os

from rucio.api.account import add_account
from rucio.api.identity import add_account_identity
from rucio.api.scope import add_scope
from rucio.api.did import add_did
from rucio.api.rse import add_rse
from rucio.db.sqla.util import build_database, create_root_account
from rucio.core.account_limit import set_account_limit
from rucio.core.rse import add_protocol, get_rse_id, add_rse_attribute

if __name__ == '__main__':

    add_account('jdoe', 'USER', 'test', 'root')

    # gsiftp://gridftp-plain-virgo.cr.cnaf.infn.it:2811/storage/gpfs_virgo4/Runs/rucio/
    params = {'scheme': 'gsiftp',
              'prefix': '/storage/gpfs_virgo4/Runs/rucioTo',
              'hostname': 'gridftp-plain-virgo.cr.cnaf.infn.it',
              'port': 2811,
              'impl': 'rucio.rse.protocols.gsiftp.Default',
              'domains': {"lan": {"read": 1,
                                  "write": 1,
                                  "delete": 1,
                                  "third_party_copy": 1},
                          "wan": {"read": 1,
                                  "write": 1,
                                  "delete": 1,
                                  "third_party_copy": 1}}}

    add_rse('CNAF_STORM', 'root')
    add_protocol('CNAF_STORM', params)
    add_rse_attribute(rse='CNAF_STORM', key='istape', value='False')
    add_rse_attribute(rse='CNAF_STORM', key='supported_checksums', value='md5')

    # srm://storm-fe-archive.cr.cnaf.infn.it:8444/srm/managerv2?SFN=/virgoplain/
    params = {'scheme': 'srm',
              'prefix': '/virgoplain/rucioTo',
              'hostname': 'storm-fe-archive.cr.cnaf.infn.it',
              'port': 8444,
              'web-service-path': '/srm/managerv2?SFN=',
              'impl': 'rucio.rse.protocols.gfal.Default',
              'domains': {"lan": {"read": 1,
                                  "write": 1,
                                  "delete": 1,
                                  "third_party_copy": 1},
                          "wan": {"read": 1,
                                  "write": 1,
                                  "delete": 1,
                                  "third_party_copy": 1}}}

    add_rse('CNAF_StoRM', 'root')
    add_protocol('CNAF_StoRM', params)
    add_rse_attribute(rse='CNAF_StoRM', key='istape', value='False')
    add_rse_attribute(rse='CNAF_StoRM', key='supported_checksums', value='adler32')

    # Now set a quota for root and jdoe on the 2 RSEs
    set_account_limit('root', get_rse_id('SITE1_DISK'), 100000000000)
    set_account_limit('root', get_rse_id('SITE2_DISK'), 100000000000)
    set_account_limit('jdoe', get_rse_id('SITE1_DISK'), 1000000000)
    set_account_limit('jdoe', get_rse_id('SITE2_DISK'), 0)
