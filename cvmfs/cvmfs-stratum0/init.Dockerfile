FROM slidspitfire/cvmfs-stratum0-latest:latest

RUN cvmfs_server mkfs -o root virgo.sw
