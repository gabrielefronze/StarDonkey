# unmount dangling mount points
umount /cvmfs/virgo.sw
umount /var/spool/cvmfs/virgo.sw/rdonly

# Let cvmfs remount them for you
cvmfs_server mount virgo.sw