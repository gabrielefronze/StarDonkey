FROM centos/systemd

MAINTAINER Gabriele Gaetano Fronzé "gfronze@cern.ch"

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
RUN echo "CVMFS_HTTP_PROXY=DIRECT" > /etc/cvmfs/default.local

RUN systemctl enable httpd.service

RUN sed '/Listen 80/ a Listen 8000' -i /etc/httpd/conf/httpd.conf
EXPOSE 80
EXPOSE 8000
# RUN systemctl restart httpd

RUN mkdir /etc/cvmfs-init-scripts
COPY stratum0-init.sh /etc/cvmfs-init-scripts

VOLUME [ “/sys/fs/cgroup” ]
CMD ["/usr/sbin/init"]

# RUN yum install -y httpd && chkconfig --levels 235 httpd on

# this repo will be mounted on /cvmfs/virgo.sw and resides in /srv/cvmfs
# cvmfs_server mkfs virgo.sw
# cvmfs_server transaction virgo.sw
# cvmfs_server publish virgo.sw
