FROM centos/systemd

MAINTAINER Gabriele Gaetano Fronzé "gfronze@cern.ch"

RUN yum update -y && yum -y install nano wget

RUN wget https://ecsft.cern.ch/dist/cvmfs/cvmfs-release/cvmfs-release-latest.noarch.rpm
RUN yum install -y cvmfs-release-latest.noarch.rpm
RUN rm -rf cvmfs-release-latest.noarch.rpm
RUN yum install -y cvmfs cvmfs-config-default

RUN echo "CVMFS_SERVER_URL=$CVMFS_STRATUM1_URL/cvmfs/$CVMFS_REPO_NAME" > /etc/cvmfs/default.local
RUN echo "CVMFS_REPOSITORIES=$CVMFS_REPO_NAME" > /etc/cvmfs/default.local
RUN echo "CVMFS_HTTP_PROXY=DIRECT" >> /etc/cvmfs/default.local
RUN echo "CVMFS_CACHE_BASE=/cvmfs-cache" >> /etc/cvmfs/default.local
RUN echo "CVMFS_QUOTA_LIMIT=10240" >> /etc/cvmfs/default.local

VOLUME [ “/sys/fs/cgroup” ]
CMD ["/usr/sbin/init"]

# setenforce 0
# cvmfs_config setup
# service autofs restart
# cvmfs_config probe
# cvmfs_config chksetup
