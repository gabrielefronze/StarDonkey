# unmount dangling mount points
umount /cvmfs/$CVMFS_REPO_NAME
umount /var/spool/cvmfs/$CVMFS_REPO_NAME/rdonly

# Let cvmfs remount them for you
cvmfs_server mount $CVMFS_REPO_NAME