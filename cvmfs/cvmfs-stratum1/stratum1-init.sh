# Setting up stratum1 to replicate stratum0 repo
cvmfs_server add-replica -o root "$CVMFS_STRATUM0_URL:$CVMFS_STRATUM0_PORT/cvmfs/$CVMFS_REPO_NAME" "$CVMFS_REPO_KEY"

# Getting sychronized with stratum0
cvmfs_server snapshot
