setenforce 0
cvmfs_config setup
service autofs restart
cvmfs_config probe
cvmfs_config chksetup
