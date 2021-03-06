# Copyright 2014-2018 CERN for the benefit of the ATLAS collaboration.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# You may not use this file except in compliance with the License.
# You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
#
# Authors:
# - Thomas Beermann, <thomas.beermann@cern.ch>, 2018
# - Cedric Serfon, <cedric.serfon@cern.ch>, 2018

FROM centos:latest

USER root

WORKDIR /opt

ADD ca.repo /etc/yum.repos.d/ca.repo

WORKDIR /tmp

RUN curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"
RUN python2.7 get-pip.py
RUN rm -f get-pip.py
RUN yum groupinstall "Development Tools" -y
RUN yum install python-devel -y
RUN yum install openssl-devel -y
RUN yum install MySQL-python -y
RUN git clone https://github.com/gabrielefronze/rucio.git

WORKDIR /tmp/rucio

RUN git checkout checksumPR
RUN pip install psycopg2-binary
RUN python2.7 setup.py install

WORKDIR /tmp

RUN rm -rf rucio

WORKDIR /opt

RUN mkdir /var/log/rucio
RUN mkdir /var/log/rucio/trace
RUN chmod 777 /var/log/rucio

ADD certs/ca.pem /opt/rucio/etc/web/CERN-bundle.pem
ADD certs/ca.pem /opt/rucio/etc/web/ca.crt
ADD certs/usercert.pem /opt/rucio/etc/web/usercert.pem

ENV PATH $PATH:/opt/rucio/bin

RUN yum install -y epel-release
RUN yum install -y gfal2-python gfal2-all
RUN yum install -y ca-policy-egi-core ca-policy-lcg fetch-crl

ADD rucio.cfg /opt/rucio/etc/
RUN chmod 644 /opt/rucio/etc/rucio.cfg
