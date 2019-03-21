# This file is subject to the terms and conditions defined by
# the Creative Commons BY-NC-CC standard and was developed by
# Gabriele Gaetano Fronzé and Sara Vallero.
# For abuse reports and other communications write to 
# <gabriele.fronze at to.infn.it>

CVMFS_REPO_NAME_PRIVATE=${1:-CVMFS_REPO_NAME}

# Creating repository
cvmfs_server mkfs -o root "$CVMFS_REPO_NAME_PRIVATE"

# Putting repository in editing state
cvmfs_server check "$CVMFS_REPO_NAME_PRIVATE"
