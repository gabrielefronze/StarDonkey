#!/bin/bash
function cvmfs_server {
    CVMFS_REPO_NAME="$2"

    echo "The operations will be performed on the repository $CVMFS_REPO_NAME"
    read -p "Press ENTER key to continue, Ctrl-C to abort..."

    docker exec -ti cvmfs-stratum0 cvmfs_server $@

    if [[ "$1" == "transaction" ]]
    then
        mount -o remount,rw overlay_"$CVMFS_REPO_NAME"
    fi

    if [[ "$1" == "publish" ]]
    then
        mount -o remount,ro overlay_"$CVMFS_REPO_NAME"
    fi

    unset CVMFS_REPO_NAME
}
