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
    #build database
    build_database()

    # create root account
    create_root_account()
    add_account_identity('/CN=docker client', 'x509', 'root', 'test@rucio.com', issuer="root")

    # create gfronze account
    add_account('gfronze', 'USER', 'test', 'root')

    # create some scopes
    add_scope('user.gfronze', 'gfronze', 'root')
    add_scope('user.root', 'root', 'root')
    add_scope('tests', 'root', 'root')