FROM centos:7

MAINTAINER Gabriele Gaetano Fronzé "gfronze@cern.ch"

RUN yum update -y && yum -y install nano wget

RUN wget https://ecsft.cern.ch/dist/cvmfs/cvmfs-release/cvmfs-release-latest.noarch.rpm
RUN yum install -y cvmfs-release-latest.noarch.rpm
RUN rm -rf cvmfs-release-latest.noarch.rpm
RUN yum install -y cvmfs cvmfs-config-default

RUN echo "CVMFS_REPOSITORIES=virgo.sw" > /etc/cvmfs/default.local
RUN echo "CVMFS_HTTP_PROXY=DIRECT" >> /etc/cvmfs/default.local
RUN echo "CVMFS_CACHE_BASE=/cvmfs-cache" >> /etc/cvmfs/default.local
RUN echo "CVMFS_QUOTA_LIMIT=10240" >> /etc/cvmfs/default.local

RUN echo "CVMFS_SERVER_URL=http://virgo-test-02/cvmfs/virgo.sw" > /etc/cvmfs/config.d/virgo.sw
