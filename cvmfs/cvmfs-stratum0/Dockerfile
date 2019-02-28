FROM centos:7
MAINTAINER Gabriele Gaetano Fronzé "gfronze@cern.ch"

ENV container docker
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == \
systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;
VOLUME [ "/sys/fs/cgroup" ]
CMD ["/usr/sbin/init"]

USER root
ENV USER root
ENV HOME /root

RUN yum update -y && yum -y install \
    man nano wget

RUN yum install epel-release -y && yum install -y jq

RUN wget https://ecsft.cern.ch/dist/cvmfs/cvmfs-release/cvmfs-release-latest.noarch.rpm
RUN yum install -y cvmfs-release-latest.noarch.rpm
RUN rm -rf cvmfs-release-latest.noarch.rpm
RUN yum install -y cvmfs cvmfs-server
RUN echo "CVMFS_HTTP_PROXY=DIRECT" >> /etc/cvmfs/default.local

EXPOSE 80

# RUN yum install -y httpd && chkconfig --levels 235 httpd on

# this repo will be mounted on /cvmfs/virgo.sw and resides in /srv/cvmfs
# RUN cvmfs_server mkfs virgo.sw
# RUN cvmfs_server transaction virgo.sw
# RUN echo "*" > /cvmfs/virgo.sw/.cvmfsdirtab
# RUN touch /srv/cvmfs/virgo.sw/.cvmfs_master_replica
# RUN cvmfs_server publish virgo.sw
