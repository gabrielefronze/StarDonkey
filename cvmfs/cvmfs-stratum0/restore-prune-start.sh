# Unmount everything mounted by fstab
echo "Unmounting $CVMFS_REPO_NAME left arounds..."
umount overlay_virgo.sw
umount /dev/fuse

# Mount rdonly and overlay directory using fstab contents
echo "Mouting $CVMFS_REPO_NAME fstab entires..."
mount cvmfs2#$CVMFS_REPO_NAME
mount overlay_$CVMFS_REPO_NAME

# Restore unit mounts
echo "Restoring systemd mount services..."
cp /cvmfs-backup/* /run/systemd/generator

# Eventually remove transaction locks left dangling: the above mounts happen to be read-only
echo "Removing transaction locks if any..."
rm -f /var/spool/cvmfs/$CVMFS_REPO_NAME/in_transaction.lock

# Remount everything using cvmfs_server
echo "Mounting cvmfs $CVMFS_REPO_NAME repository..."
cvmfs_server mount $CVMFS_REPO_NAME
