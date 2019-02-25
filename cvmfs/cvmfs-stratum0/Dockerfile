FROM scientificlinux/sl
MAINTAINER Gabriele Gaetano Fronzé "gfronze@cern.ch"

USER root
ENV USER root
ENV HOME /root

RUN yum update -y && yum -y install \
    man nano wget

RUN yum install epel-release -y && yum install -y jq

RUN wget https://ecsft.cern.ch/dist/cvmfs/cvmfs-release/cvmfs-release-latest.noarch.rpm && yum install -y cvmfs-release-latest.noarch.rpm && rm -rf cvmfs-release-latest.noarch.rpm
RUN yum install -y cvmfs cvmfs-server

RUN yum install -y httpd && chkconfig --levels 235 httpd on

# this repo will be mounted on /cvmfs/virgo.sw and resides in /srv/cvmfs
# RUN cvmfs_server mkfs virgo.sw
# RUN cvmfs_server transaction virgo.sw
# RUN echo "*" > /cvmfs/virgo.sw/.cvmfsdirtab
# RUN touch /srv/cvmfs/virgo.sw/.cvmfs_master_replica
# RUN cvmfs_server publish virgo.sw
