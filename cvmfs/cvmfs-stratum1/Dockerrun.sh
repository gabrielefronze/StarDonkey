docker build -t slidspitfire/cvmfs-stratum1-latest:latest .

mkdir /var/cvmfs-docker/stratum1
mkdir /var/cvmfs-docker/stratum1/var-spool-cvmfs
mkdir /var/cvmfs-docker/stratum1/cvmfs

docker run -d \
-p 80:80 -p 8000:8000 \
--name cvmfs-stratum1 \
--hostname cvmfs-stratum1 \
--privileged \
--env-file ../cvmfs-variables.env \
--mount type=bind,source=/var/cvmfs-docker/stratum1/var-spool-cvmfs,target=/var/spool/cvmfs \
--mount type=bind,source=/var/cvmfs-docker/stratum1/cvmfs,target=/cvmfs \
--volume /var/cvmfs-docker/stratum1/srv-cvmfs:/srv/cvmfs \
--volume /var/cvmfs-docker/stratum1/etc-cvmfs:/etc/cvmfs \
--volume /sys/fs/cgroup:/sys/fs/cgroup \
slidspitfire/cvmfs-stratum1-latest:latest