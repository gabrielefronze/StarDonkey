
FROM centos/systemd:latest

COPY crontab /etc/crontab
COPY supervisord.conf etc/supervisord.conf
COPY fts3config etc/fts3/fts3config
COPY fts-msg-monitoring.conf etc/fts3/fts-msg-monitoring.conf

RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN rpm -Uvh https://repo.opensciencegrid.org/osg/3.4/osg-3.4-el7-release-latest.rpm
RUN yum install -y osg-ca-certs yum-plugin-priorities osg-gridftp fts-server fts-client fts-rest fts-monitoring fts-mysql fts-server-selinux fts-rest-selinux fts-monitoring-selinux fts-msg fts-infosys cronie crontabs supervisor

# Installing custom gfal2 rpm with multi stream support
RUN yum install -y wget
WORKDIR /tmp
RUN wget http://dmc-repo.web.cern.ch/dmc-repo/gridftp_streamed/el6/x86_64/gfal2-all-2.16.4-r1909161131.el6.x86_64.rpm
RUN rpm -ivh gfal2-all-2.16.4-r1909161131.el6.x86_64.rpm
RUN yum install -y gfal2-util

COPY fts-diff-4.0.1.sql /usr/share/fts-mysql/fts-diff-4.0.1.sql

RUN yum -y install mariadb
EXPOSE 8446 8449

# Grant group write access
RUN chmod -R 775 /etc/grid-security /etc/httpd /run/httpd /var/log/httpd /var/lib/fts3 /var/log/fts3 /var/log/fts3rest /var/lib/fts3 /usr/share/fts3web
RUN chmod 775 /run /etc/fts3
RUN chmod g=u /etc/passwd

# Grant group read access
RUN chmod 664 /etc/fts3/*
RUN chmod 660 /etc/pki/tls/certs/localhost.crt /etc/pki/tls/private/localhost.key

# Change group from apache to root
RUN chgrp -R root /run/httpd /etc/fts3web

# Don't listen on privileged ports
RUN sed -i 's/Listen 80/#Listen 80/' /etc/httpd/conf/httpd.conf
RUN sed -i 's/Listen 443/#Listen 443/' /etc/httpd/conf.d/ssl.conf

COPY docker-entrypoint-slateci.sh tmp/docker-entrypoint.sh
ENTRYPOINT sh tmp/docker-entrypoint.sh