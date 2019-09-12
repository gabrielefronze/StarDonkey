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
from rucio.api.rse import add_distance
from rucio.db.sqla.util import build_database, create_root_account
from rucio.api.account_limit import set_account_limit
from rucio.core.rse import add_rse, add_protocol, get_rse_id, add_rse_attribute

if __name__ == '__main__':
    # gsiftp://gridftp-plain-virgo.cr.cnaf.infn.it:2811/storage/gpfs_virgo4/rucio-dev/rucio.torino.test
    params =   {'scheme': 'gsiftp',
                'prefix': '/storage/gpfs_virgo4/rucio-dev/rucio.torino.test',
                'hostname': 'gridftp-plain-virgo.cr.cnaf.infn.it',
                'port': 2811,
                'impl': 'rucio.rse.protocols.gfal.Default',
                'domains': {"lan": {"read": 1,
                                    "write": 1,
                                    "delete": 1,
                                    "third_party_copy": 1},
                            "wan": {"read": 1,
                                    "write": 1,
                                    "delete": 1,
                                    "third_party_copy": 1}}}

    # Add RSE
    print('Adding RSE CNAF_GRIDFTP...')
    add_rse('CNAF_GRIDFTP')
    CNAF_GRIDFTP_id = get_rse_id('CNAF_GRIDFTP')
    
    # Setup protocol
    print('    Adding Protocol...')
    add_protocol(CNAF_GRIDFTP_id, params)

    # Setting up RSE attributes
    print('    Setting FTS server...')
    add_rse_attribute(CNAF_GRIDFTP_id, key='istape', value='False')
    add_rse_attribute(CNAF_GRIDFTP_id, key='supported_checksums', value='md5')

    # Setup fts connection
    print('    Setting FTS server...')
    add_rse_attribute(CNAF_GRIDFTP_id, key='fts', value='https://fts3-pilot.cern.ch:8446')

    print('DONE!')

    #==================================================================================
    # srm://storm-fe-archive.cr.cnaf.infn.it:8444/srm/managerv2?SFN=/virgoplain/rucio.torino.test
    params =   {'scheme': 'srm',
                'prefix': '/virgoplain/rucio.torino.test',
                'hostname': 'storm-fe-archive.cr.cnaf.infn.it',
                'port': 8444,
                'extended_attributes': {'web_service_path': '/srm/managerv2?SFN='},
                'impl': 'rucio.rse.protocols.gfal.Default',
                'domains': {"lan": {"read": 1,
                                    "write": 1,
                                    "delete": 1,
                                    "third_party_copy": 1},
                            "wan": {"read": 1,
                                    "write": 1,
                                    "delete": 1,
                                    "third_party_copy": 1}}}

    # Add RSE
    print('Adding RSE CNAF_STORM...')
    add_rse('CNAF_STORM')
    CNAF_STORM_id = get_rse_id('CNAF_STORM')

    # Setup protocol
    print('    Adding Protocol...')
    add_protocol(CNAF_STORM_id, params)

    # Setting up RSE attributes
    print('    Setting attributes...')
    add_rse_attribute(CNAF_STORM_id, key='istape', value='False')
    add_rse_attribute(CNAF_STORM_id, key='supported_checksums', value='adler32')

    # Setup fts connection
    print('    Setting FTS server...')
    add_rse_attribute(CNAF_STORM_id, key='fts', value='https://fts3-pilot.cern.ch:8446')

    print('DONE!')

    #==================================================================================
    # Setting up account limits
    print('Setting account limits...')
    set_account_limit('root', 'CNAF_STORM', 100000000000, 'root')
    set_account_limit('root', 'CNAF_GRIDFTP', 100000000000, 'root')
    set_account_limit('gfronze', 'CNAF_STORM', 100000000000, 'root')
    set_account_limit('gfronze', 'CNAF_GRIDFTP', 0, 'root')

    # Setting up distances
    print('Setting distances...')
    add_distance('CNAF_STORM', 'CNAF_GRIDFTP', 'root', 1, 1)
    add_distance('CNAF_GRIDFTP', 'CNAF_STORM', 'root', 1, 1)

    print('DONE!')
