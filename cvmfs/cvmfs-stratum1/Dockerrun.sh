docker run -d \
-p 80:80 -p 8000:8000 \
--name cvmfs-stratum1 \
--hostname cvmfs-stratum1 \
--privileged \
--env-file ../cvmfs-variables.env \
--volume /var/cvmfs-docker/stratum1/var/spool/cvmfs:/var/spool/cvmfs \
--volume /var/cvmfs-docker/stratum1/cvmfs:/cvmfs \
--volume /var/cvmfs-docker/stratum1/srv/cvmfs:/srv/cvmfs \
--volume /var/cvmfs-docker/stratum1/etc/cvmfs:/etc/cvmfs \
--volume /sys/fs/cgroup:/sys/fs/cgroup \
slidspitfire/cvmfs-stratum1-latest:latest