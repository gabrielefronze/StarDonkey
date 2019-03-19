CVMFS_REPO_NAME_PRIVATE=${1:-CVMFS_REPO_NAME}

# unmount dangling mount points
umount /cvmfs/$CVMFS_REPO_NAME_PRIVATE
umount /var/spool/cvmfs/$CVMFS_REPO_NAME_PRIVATE/rdonly

# Let cvmfs remount them for you
cvmfs_server mount $CVMFS_REPO_NAME_PRIVATE