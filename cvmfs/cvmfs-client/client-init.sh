echo "CVMFS_SERVER_URL=$CVMFS_STRATUM1_URL/cvmfs/$CVMFS_REPO_NAME" > /etc/cvmfs/default.local
echo "CVMFS_REPOSITORIES=$CVMFS_REPO_NAME" >> /etc/cvmfs/default.local
echo "CVMFS_HTTP_PROXY=DIRECT" >> /etc/cvmfs/default.local
echo "CVMFS_CACHE_BASE=/cvmfs-cache" >> /etc/cvmfs/default.local
echo "CVMFS_QUOTA_LIMIT=10240" >> /etc/cvmfs/default.local

setenforce 0
cvmfs_config setup
service autofs restart
cvmfs_config probe
cvmfs_config chksetup
