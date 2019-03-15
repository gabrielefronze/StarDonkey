echo "WARNING: this script is intended to remove ALL CVMFS data in a test environment."
echo "If you are not COMPLETELY SURE of what will happen EXIT IMMEDIATELY using Ctrl-C!"
read -p "Otherwise press ENTER key to continue..."

# Unmounting folders
umount overlay_virgo.sw
umount /dev/fuse

# Removing the tree folder
rm -rf /var/cvmfs-docker/