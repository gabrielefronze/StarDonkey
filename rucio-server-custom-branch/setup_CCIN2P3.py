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
    # gsiftp://ccosvms0237.in2p3.fr:2811/tempZone/hoft_C00/rucio.torino.test
    params =   {'scheme': 'gsiftp',
                'prefix': '/tempZone/hoft_C00/rucio.torino.test',
                'hostname': 'ccosvms0237.in2p3.fr',
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
    print('Adding RSE CCIN2P3_GRIDFTP...')
    add_rse('CCIN2P3_GRIDFTP')
    CCIN2P3_GRIDFTP_id = get_rse_id('CCIN2P3_GRIDFTP')
    
    # Setup protocol
    print('    Adding Protocol...')
    add_protocol(CCIN2P3_GRIDFTP_id, params)

    # Setting up RSE attributes
    print('    Setting attributes...')
    add_rse_attribute(CCIN2P3_GRIDFTP_id, key='istape', value='False')
    add_rse_attribute(CCIN2P3_GRIDFTP_id, key='supported_checksums', value='md5')

    # Setup fts connection
    print('    Setting FTS server...')
    add_rse_attribute(CCIN2P3_GRIDFTP_id, key='fts', value='https://fts3-pilot.cern.ch:8446')

    print('DONE!')

    #==================================================================================
    # Setting up account limits
    print('Setting account limits...')
    set_account_limit('root', 'CCIN2P3_GRIDFTP', 100000000000, 'root')
    set_account_limit('gfronze', 'CCIN2P3_GRIDFTP', 10000, 'root')

    # Setting up distances
    print('Setting distances...')
    add_distance('CCIN2P3_GRIDFTP', 'CNAF_GRIDFTP', 'root', 1, 1)
    add_distance('CNAF_GRIDFTP', 'CCIN2P3_GRIDFTP', 'root', 1, 1)
    add_distance('CCIN2P3_GRIDFTP', 'CNAF_STORM', 'root', 1, 1)
    add_distance('CNAF_STORM', 'CCIN2P3_GRIDFTP', 'root', 1, 1)

    print('DONE!')