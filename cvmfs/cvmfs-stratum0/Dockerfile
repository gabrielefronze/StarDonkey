FROM centos/systemd

MAINTAINER Gabriele Gaetano Fronzé "gfronze@cern.ch"

USER root
ENV USER root
ENV HOME /root

RUN yum update -y && yum -y install \
    man nano wget epel-release jq

RUN wget https://ecsft.cern.ch/dist/cvmfs/cvmfs-release/cvmfs-release-latest.noarch.rpm
RUN yum install -y cvmfs-release-latest.noarch.rpm
RUN rm -rf cvmfs-release-latest.noarch.rpm
RUN yum install -y cvmfs cvmfs-server
RUN echo "CVMFS_HTTP_PROXY=DIRECT" > /etc/cvmfs/default.local

RUN systemctl enable httpd.service
RUN sed '/Listen 80/ a Listen 8000' -i /etc/httpd/conf/httpd.conf
EXPOSE 80
EXPOSE 8000

RUN mkdir /etc/cvmfs-scripts
COPY restore-kill-start.sh /etc/cvmfs-scripts
COPY stratum0-init.sh /etc/cvmfs-scripts
RUN chmod +x /etc/cvmfs-scripts/stratum0-init.sh
RUN chmod +x /etc/cvmfs-scripts/restore-kill-start.sh

VOLUME [ “/sys/fs/cgroup” ]
CMD ["/usr/sbin/init"]
