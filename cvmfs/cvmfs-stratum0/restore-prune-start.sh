# Mount rdonly and overlay directory using fstab contents
mount cvmfs2#$CVMFS_REPO_NAME
mount overlay_$CVMFS_REPO_NAME

# Restore unit mounts
cp /cvmfs-backup/* /run/systemd/generator

# Eventually remove transaction locks left dangling: the above mounts happen to be read-only
rm -f /var/spool/cvmfs/$CVMFS_REPO_NAME/in_transaction.lock

# Remount everything using cvmfs_server
cvmfs_server mount $CVMFS_REPO_NAME
