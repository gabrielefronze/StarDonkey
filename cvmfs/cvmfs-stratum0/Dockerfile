FROM httpd:2.4

MAINTAINER Gabriele Gaetano Fronzé "gfronze@cern.ch"

USER root
ENV USER root
ENV HOME /root

RUN apt-get update -y && apt-get -y install \
    man nano jq wget rpm

RUN wget https://ecsft.cern.ch/dist/cvmfs/cvmfs-release/cvmfs-release-latest.noarch.rpm
RUN rpm -i cvmfs-release-latest.noarch.rpm
RUN rm -rf cvmfs-release-latest.noarch.rpm
RUN apt-get install -y cvmfs cvmfs-server
RUN echo "CVMFS_HTTP_PROXY=DIRECT" > /etc/cvmfs/default.local

RUN sed '/Listen 80/ a Listen 8000' -i /etc/httpd/conf/httpd.conf
EXPOSE 80
EXPOSE 8000

RUN mkdir /etc/cvmfs-init-scripts
COPY stratum0-init.sh /etc/cvmfs-init-scripts
RUN chmod +x /etc/cvmfs-init-scripts/stratum0-init.sh

VOLUME [ “/sys/fs/cgroup” ]
CMD ["/usr/sbin/init"]
