# Creating repository
cvmfs_server mkfs -o root "$CVMFS_REPO_NAME"

# Putting repository in editing state
cvmfs_server transaction "$CVMFS_REPO_NAME"

# Pushing empty changes, for good measure (something like "first commit")
cvmfs_server publish "$CVMFS_REPO_NAME"
