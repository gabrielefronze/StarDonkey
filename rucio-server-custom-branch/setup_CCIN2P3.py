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
    # gsiftp://ccosvms0237.in2p3.fr/:2811/ccin2p3/virgo/DATA/test/
    params =   {'scheme': 'gsiftp',
                'prefix': '/tempZone/home/gfronze/rucio.torino.test',
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
    add_rse('CCIN2P3_GRIDFTP', 'root')
    
    # Setup protocol
    add_protocol('CCIN2P3_GRIDFTP', params)

    # Setting up RSE attributes
    add_rse_attribute(rse='CCIN2P3_GRIDFTP', key='istape', value='False')
    add_rse_attribute(rse='CCIN2P3_GRIDFTP', key='supported_checksums', value='md5')

    # Setup fts connection
    add_rse_attribute(rse='CCIN2P3_GRIDFTP', key='fts', value='fts3-devel.cern.ch:8446')

    # Setup fts connection
    add_rse_attribute(rse='CCIN2P3_GRIDFTP', key='fts', value='fts3-devel.cern.ch:8446')

    #==================================================================================
    # Setting up account limits
    set_account_limit('root', get_rse_id('CCIN2P3_GRIDFTP'), 100000000000)
    set_account_limit('gfronze', get_rse_id('CCIN2P3_GRIDFTP'), 10000)