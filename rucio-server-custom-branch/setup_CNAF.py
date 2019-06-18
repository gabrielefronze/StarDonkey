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
from rucio.api.rse import add_rse, add_distance
from rucio.db.sqla.util import build_database, create_root_account
from rucio.core.account_limit import set_account_limit
from rucio.core.rse import add_protocol, get_rse_id, add_rse_attribute

if __name__ == '__main__':
    #==================================================================================
    # create root account
    build_database()
    create_root_account()
    add_account_identity('/CN=docker client', 'x509', 'root', 'test@rucio.com', issuer="root")

    # create gfronze account
    add_account('gfronze', 'USER', 'test', 'root')

    # create some scopes
    add_scope('user.gfronze', 'gfronze', 'root')
    add_scope('user.root', 'root', 'root')
    add_scope('tests', 'root', 'root')

    # gsiftp://gridftp-plain-virgo.cr.cnaf.infn.it:2811/storage/gpfs_virgo4/Runs/rucio/
    params =   {'scheme': 'gsiftp',
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

    # Add RSE
    add_rse('CNAF_GRIDFTP', 'root')
    
    # Setup protocol
    add_protocol('CNAF_GRIDFTP', params)

    # Setting up RSE attributes
    add_rse_attribute(rse='CNAF_GRIDFTP', key='istape', value='False')
    add_rse_attribute(rse='CNAF_GRIDFTP', key='supported_checksums', value='md5')

    # Setup fts connection
    add_rse_attribute(rse='CNAF_GRIDFTP', key='fts', value='fts3-devel.cern.ch:8446')

    #==================================================================================
    # srm://storm-fe-archive.cr.cnaf.infn.it:8444/srm/managerv2?SFN=/virgoplain/
    params =   {'scheme': 'srm',
                'prefix': '/virgoplain/rucioTo',
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
    add_rse('CNAF_STORM', 'root')

    # Setup protocol
    add_protocol('CNAF_STORM', params)

    # Setting up RSE attributes
    add_rse_attribute(rse='CNAF_STORM', key='istape', value='False')
    add_rse_attribute(rse='CNAF_STORM', key='supported_checksums', value='adler32')

    # Setup fts connection
    add_rse_attribute(rse='CNAF_GRIDFTP', key='fts', value='fts3-devel.cern.ch:8446')

    #==================================================================================
    # Setting up account limits
    set_account_limit('root', get_rse_id('CNAF_STORM'), -1)
    set_account_limit('root', get_rse_id('CNAF_GRIDFTP'), -1)
    set_account_limit('gfronze', get_rse_id('CNAF_STORM'), -1)
    set_account_limit('gfronze', get_rse_id('CNAF_GRIDFTP'), -1)

    # Setting up distances
    add_distance('CNAF_STORM', 'CNAF_GRIDFTP', 'root', 1, 1)
    add_distance('CNAF_GRIDFTP', 'CNAF_STORM', 'root', 1, 1)