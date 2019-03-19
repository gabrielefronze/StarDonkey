# Creating repository
cvmfs_server mkfs -o root "$CVMFS_REPO_NAME"

# Putting repository in editing state
cvmfs_server transaction "$CVMFS_REPO_NAME"

# Pushing empty changes, for good measure (something like "first commit")
cvmfs_server publish "$CVMFS_REPO_NAME"

# Backup the unit mount files
cp /run/systemd/generator/cvmfs-"$CVMFS_REPO_NAME".mount /cvmfs-backup
cp /run/systemd/generator/var-spool-cvmfs-"$CVMFS_REPO_NAME"-rdonly.mount /cvmfs-backup

