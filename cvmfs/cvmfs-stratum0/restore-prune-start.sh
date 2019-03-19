CVMFS_REPO_NAME_PRIVATE=${1:-CVMFS_REPO_NAME}

# Unmount everything mounted by fstab
echo "Unmounting $CVMFS_REPO_NAME_PRIVATE left arounds..."
umount overlay_$CVMFS_REPO_NAME_PRIVATE
umount /dev/fuse

# Mount rdonly and overlay directory using fstab contents
echo "Mouting $CVMFS_REPO_NAME_PRIVATE fstab entires..."
mount cvmfs2#$CVMFS_REPO_NAME_PRIVATE
mount overlay_$CVMFS_REPO_NAME_PRIVATE

# Restore unit mounts
echo "Restoring systemd mount services..."
/usr/lib/systemd/system-generators/systemd-fstab-generator /run/systemd/generator '' ''
systemctl daemon-reload

# Eventually remove transaction locks left dangling: the above mounts happen to be read-only
echo "Removing transaction locks if any..."
rm -f /var/spool/cvmfs/$CVMFS_REPO_NAME_PRIVATE/in_transaction.lock

# Remount everything using cvmfs_server
echo "Mounting cvmfs $CVMFS_REPO_NAME_PRIVATE repository..."
cvmfs_server mount $CVMFS_REPO_NAME_PRIVATE
