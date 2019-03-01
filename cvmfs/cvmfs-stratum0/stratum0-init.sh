cvmfs_server mkfs -o root "$CVMFS_REPO_NAME"
cvmfs_server transaction "$CVMFS_REPO_NAME"
cvmfs_server publish "$CVMFS_REPO_NAME"
