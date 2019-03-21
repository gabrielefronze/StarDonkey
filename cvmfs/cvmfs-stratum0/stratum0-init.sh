CVMFS_REPO_NAME_PRIVATE=${1:-CVMFS_REPO_NAME}

# Creating repository
cvmfs_server mkfs -o root "$CVMFS_REPO_NAME_PRIVATE"

# Putting repository in editing state
cvmfs_server check "$CVMFS_REPO_NAME_PRIVATE"
