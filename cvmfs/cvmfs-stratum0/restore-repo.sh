REPO_NAME="$1"

# Recreate the httpd configuration file
if [[ ! -f /etc/httpd/confd/cvmfs."$REPO_NAME".conf ]]; then
    echo "Recreating httpd configuration files for $REPO_NAME"
    cp /etc/cvmfs-scripts/cvmfs.dummy.conf /etc/httpd/conf.d/cvmfs."$REPO_NAME".conf
    sed -i "s/DUMMY_REPLACE_ME/${REPO_NAME}/g" /etc/httpd/conf.d/cvmfs."$REPO_NAME".conf
    systemctl restart httpd
fi

# Recreate fstab entries and restore unit mounts
if [[ ! $(grep -q $REPO_NAME /etc/fstab) ]]; then
    if [[ ! -f /etc/fstab ]]; then
        touch /etc/fstab
    fi
    
    echo "Recreating fstab entries for $REPO_NAME"
    cp /etc/cvmfs-scripts/dummy-fstab /etc/"$REPO_NAME"-fstab
    sed -i "s/DUMMY_REPLACE_ME/${REPO_NAME}/g" /etc/"$REPO_NAME"-fstab
    cat /etc/"$REPO_NAME"-fstab >> /etc/fstab
    rm -f /etc/"$REPO_NAME"-fstab

    echo "Restoring systemd mount services..."
    /usr/lib/systemd/system-generators/systemd-fstab-generator /run/systemd/generator '' ''
    systemctl daemon-reload
fi

# Unmount everything mounted by fstab
echo "Unmounting $REPO_NAME left arounds..."
umount overlay_"$REPO_NAME"
umount /dev/fuse

# Mount rdonly and overlay directory using fstab contents
# echo "Mouting $REPO_NAME fstab entires..."
# mount cvmfs2#"$REPO_NAME"
# mount overlay_"$REPO_NAME"

# Eventually remove transaction locks left dangling: the above mounts happen to be read-only
if [[ -f /var/spool/cvmfs/"$REPO_NAME"/in_transaction.lock ]]; then
    echo "Removing transaction locks..."
    rm -f /var/spool/cvmfs/"$REPO_NAME"/in_transaction.lock
fi

# Remount everything using cvmfs_server
echo "Mounting cvmfs $REPO_NAME repository..."
cvmfs_server mount "$REPO_NAME"
