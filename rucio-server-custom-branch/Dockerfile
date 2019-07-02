# Copyright 2014-2018 CERN for the benefit of the ATLAS collaboration.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# You may not use this file except in compliance with the License.
# You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
#
# Authors:
# - Thomas Beermann, <thomas.beermann@cern.ch>, 2018
# - Cedric Serfon, <cedric.serfon@cern.ch>, 2018

FROM rucio/rucio-systemd-cc7

USER root

ADD ca.repo /etc/yum.repos.d/ca.repo
RUN pip install --upgrade setuptools
RUN yum install -y git
RUN yum install -y voms-clients-cpp

RUN mkdir -p /tmp/EggCache
RUN env PYTHON_EGG_CACHE=/tmp/EggCache

WORKDIR /
RUN git clone https://github.com/gabrielefronze/rucio.git
WORKDIR /rucio
RUN git checkout checksumPR
RUN pip install --upgrade pip
RUN pip install --upgrade m2crypto==0.32.0
RUN pip install -e .
RUN python setup.py install
RUN python setup_rucio.py install
RUN ln -s /rucio/lib/rucio /usr/lib/python2.7/site-packages/rucio

WORKDIR /opt
ADD rucio.cfg /opt/rucio/etc/
RUN chmod 644 /opt/rucio/etc/rucio.cfg
ADD alembic.ini /opt/rucio/etc/
RUN chmod 644 /opt/rucio/etc/alembic.ini
ADD aliases-py27.conf /opt/rucio/etc/web/
RUN chmod 644 /opt/rucio/etc/web/aliases-py27.conf
ADD ui-aliases-py27.conf /opt/rucio/etc/web/
RUN chmod 644 /opt/rucio/etc/web/ui-aliases-py27.conf
ADD automatix.json /opt/rucio/etc/

RUN mkdir /opt/rucio/tools
ADD dump_schema.py /opt/rucio/tools
RUN chmod 755 /opt/rucio/tools/dump_schema.py
ADD activate_rucio_global_completion.sh /opt/rucio/tools
RUN cat /opt/rucio/tools/activate_rucio_global_completion.sh >> /root/.bashrc

RUN mkdir /var/log/rucio
RUN mkdir /var/log/rucio/trace
RUN chmod 777 /var/log/rucio

ADD httpd.conf /etc/httpd/conf/httpd.conf
ADD rucio.conf /etc/httpd/conf.d/rucio.conf

ADD certs/ca.pem /opt/rucio/etc/web/CERN-bundle.pem
ADD certs/ca.pem /opt/rucio/etc/web/ca.crt
ADD certs/usercert.pem /opt/rucio/etc/web/usercert.pem

ADD certs/server.crt /etc/grid-security/hostcert.pem
ADD certs/server.key /etc/grid-security/hostkey.pem
RUN chmod 400 /etc/grid-security/hostkey.pem

RUN mkdir -p /rucio-scripts
ADD setup_* /rucio-scripts
ADD wait-for-it.sh /rucio-scripts

WORKDIR /opt/rucio

RUN rm /etc/httpd/conf.d/ssl.conf /etc/httpd/conf.d/autoindex.conf /etc/httpd/conf.d/userdir.conf /etc/httpd/conf.d/welcome.conf

EXPOSE 443

ENV PATH $PATH:/opt/rucio/bin
