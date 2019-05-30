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

    params = {'scheme': 'file',
              'prefix': '/tmp/SITE1_DISK/',
              'impl': 'rucio.rse.protocols.srm.Default',
              'domains': {"lan": {"read": 1,
                                  "write": 1,
                                  "delete": 1},
                          "wan": {"read": 1,
                                  "write": 1,
                                  "delete": 1}}}

    add_rse('CNAF_STORM', 'root')
    add_protocol('CNAF_STORM', params)
    add_rse_attribute(rse='CNAF_STORM', key='istape', value='False')
    add_rse_attribute(rse='CNAF_STORM', key='supported_checksums', value='adler32')

    params = {'scheme': 'file',
              'prefix': '/tmp/SITE2_DISK/',
              'impl': 'rucio.rse.protocols.gfal.Default',
              'domains': {"lan": {"read": 1,
                                  "write": 1,
                                  "delete": 1},
                          "wan": {"read": 1,
                                  "write": 1,
                                  "delete": 1}}}

    add_rse('CNAF_GFTP', 'root')
    add_protocol('CNAF_GFTP', params)
    add_rse_attribute(rse='CNAF_GFTP', key='istape', value='False')
    add_rse_attribute(rse='CNAF_GFTP', key='supported_checksums', value='md5')

    # Now set a quota for root and jdoe on the 2 RSEs
    set_account_limit('root', get_rse_id('SITE1_DISK'), 100000000000)
    set_account_limit('root', get_rse_id('SITE2_DISK'), 100000000000)
    set_account_limit('jdoe', get_rse_id('SITE1_DISK'), 1000000000)
    set_account_limit('jdoe', get_rse_id('SITE2_DISK'), 0)
