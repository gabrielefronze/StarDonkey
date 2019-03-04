docker exec --user root -ti cvmfs-stratum1 mkdir /etc/cvmfs/keys
docker cp cvmfs-stratum0:/etc/cvmfs/keys/virgo.sw.pub cvmfs-stratum1:/etc/cvmfs/keys

docker exec --user root -ti cvmfs-client mkdir /etc/cvmfs/keys
docker cp cvmfs-stratum0:/etc/cvmfs/keys/virgo.sw.pub cvmfs-client:/etc/cvmfs/keys
