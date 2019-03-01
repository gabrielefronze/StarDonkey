docker run -d \
-p 80:80 -p 8000:8000 \
slidspitfire/cvmfs-stratum0-latest:latest \
-name cvmfs-stratum0 \
--hostname cvmfs-stratum0 \
--privileged \
--env-file ./cvmfs-variables.env \
--volume /var/cvmfs-docker/stratum0/var/spool/cvmfs:/var/spool/cvmfs \
--volume /var/cvmfs-docker/stratum0/cvmfs:/cvmfs \
--volume /var/cvmfs-docker/stratum0/srv/cvmfs:/srv/cvmfs \
--volume /var/cvmfs-docker/stratum0/etc/cvmfs:/etc/cvmfs \
--volume /sys/fs/cgroup:/sys/fs/cgroup