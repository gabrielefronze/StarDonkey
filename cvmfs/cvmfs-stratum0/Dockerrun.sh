CVMFS_ROOT_DIR=/var/cvmfs-docker/stratum0
CVMFS_CONTAINER_IMAGE_NAME=slidspitfire/cvmfs-stratum0-base:latest
ENV_FILE=../cvmfs-variables.env

sh Dockerrun-args.sh $CVMFS_ROOT_DIR $CVMFS_CONTAINER_IMAGE_NAME $ENV_FILE
