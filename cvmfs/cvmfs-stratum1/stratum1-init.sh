cvmfs_server add-replica -o root "$CVMFS_STRATUM0_URL:$CVMFS_STRATUM0_PORT/cvmfs/$CVMFS_REPO_NAME" "$CVMFS_REPO_KEY"
cvmfs_server snapshot
