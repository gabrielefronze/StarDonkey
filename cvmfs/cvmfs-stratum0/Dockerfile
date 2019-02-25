FROM scientificlinux/sl
MAINTAINER Gabriele Gaetano Fronzé "gfronze@cern.ch"

USER root
ENV USER root
ENV HOME /root

RUN yum update -y && yum -y install \
    cvmfs cvmfs-server \
    man nano

RUN yum install -y httpd && chkconfig --levels 235 httpd on && /etc/init.d/httpd start

VOLUME /srv/spool/cvmfs
VOLUME /srv/cvmfs
VOLUME /etc/cvmfs

# this repo will be mounted on /cvmfs/virgo.sw and resides in /srv/cvmfs
RUN cvmfs_server mkfs virgo.sw
RUN cvmfs_server transaction virgo.sw
RUN echo "*" > /cvmfs/virgo.sw/.cvmfsdirtab
RUN touch /srv/cvmfs/virgo.sw/.cvmfs_master_replica
RUN cvmfs_server publish virgo.sw
