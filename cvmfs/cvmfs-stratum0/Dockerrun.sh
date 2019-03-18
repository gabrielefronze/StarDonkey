docker build -t slidspitfire/cvmfs-stratum0-latest:latest .

mkdir -p /var/cvmfs-docker/stratum0/var-spool-cvmfs
mkdir -p /var/cvmfs-docker/stratum0/cvmfs
mkdir -p /var/cvmfs-docker/stratum0/srv-cvmfs
mkdir -p /var/cvmfs-docker/stratum0/etc-cvmfs

docker run -d \
-p 80:80 -p 8000:8000 \
--name cvmfs-stratum0 \
--hostname cvmfs-stratum0 \
--privileged \
--env-file ../cvmfs-variables.env \
--mount type=bind,source=/var/cvmfs-docker/stratum0/var-spool-cvmfs,target=/var/spool/cvmfs,bind-propagation=rshared,consistency=consistent \
--mount type=bind,source=/var/cvmfs-docker/stratum0/cvmfs,target=/cvmfs,bind-propagation=rshared,consistency=consistent \
--mount type=bind,source=/var/cvmfs-docker/stratum0/srv-cvmfs,target=/srv/cvmfs,bind-propagation=rshared,consistency=consistent \
--mount type=bind,source=/var/cvmfs-docker/stratum0/etc-cvmfs,target=/etc/cvmfs,bind-propagation=rshared,consistency=consistent \
--volume /sys/fs/cgroup:/sys/fs/cgroup \
slidspitfire/cvmfs-stratum0-latest:latest