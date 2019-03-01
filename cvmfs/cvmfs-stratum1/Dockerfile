FROM slidspitfire/cvmfs-stratum0-latest:latest
MAINTAINER Gabriele Gaetano Fronzé "gfronze@cern.ch"

RUN wget https://raw.githubusercontent.com/cvmfs/cvmfs_info/master/cvmfs_info
RUN chmod +x cvmfs_info
RUN yum install -y perl-Compress-Zlib perl-Data-Dumper perl-libwww-perl perl-JSON

USER root
ENV USER root
ENV HOME /root

RUN yum install mod_wsgi -y

RUN mkdir /etc/cvmfs-init-scripts
COPY stratum1-init.sh /etc/cvmfs-init-scripts
