CVMFS_REPO_NAME_PRIVATE=${1:-CVMFS_REPO_NAME}

# Creating repository
cvmfs_server mkfs -o root "$CVMFS_REPO_NAME_PRIVATE"

# Putting repository in editing state
cvmfs_server transaction "$CVMFS_REPO_NAME_PRIVATE"

# Pushing empty changes, for good measure (something like "first commit")
cvmfs_server publish "$CVMFS_REPO_NAME_PRIVATE"

# Backup the unit mount files
cp /run/systemd/generator/cvmfs-"$CVMFS_REPO_NAME_PRIVATE".mount /cvmfs-backup
cp /run/systemd/generator/var-spool-cvmfs-"$CVMFS_REPO_NAME_PRIVATE"-rdonly.mount /cvmfs-backup

