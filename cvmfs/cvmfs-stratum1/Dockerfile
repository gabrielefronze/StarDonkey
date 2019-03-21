FROM slidspitfire/cvmfs-stratum0-base:latest

USER root
ENV USER root
ENV HOME /root

RUN yum install -y perl-Compress-Zlib perl-Data-Dumper perl-libwww-perl perl-JSON mod_wsgi
RUN wget https://raw.githubusercontent.com/cvmfs/cvmfs_info/master/cvmfs_info
RUN chmod +x cvmfs_info

RUN rm /etc/cvmfs-scripts/stratum0-init.sh
COPY stratum1-init.sh /etc/cvmfs-scripts
RUN chmod +x /etc/cvmfs-scripts/stratum1-init.sh
