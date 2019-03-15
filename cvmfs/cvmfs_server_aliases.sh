#!/bin/bash
function cvmfs_server {
    if [[ -z "$CVMFS_REPO_NAME" ]]
    then
        read -p "Enter the repository name: " reponame
        export CVMFS_REPO_NAME=$reponame
    else
        echo "The operations will be performed on the repository $CVMFS_REPO_NAME"
        read -p "Press ENTER key to continue, Ctrl-C to abort..."
    fi

    docker exec -ti cvmfs_server cvmfs-stratum0 $@

    if [[ "$1" == "transaction" ]]
    then
        mount -o remount,rw overlay_"$CVMFS_REPO_NAME"
    fi

    if [[ "$1" == "publish" ]]
    then
        mount -o remount,ro overlay_"$CVMFS_REPO_NAME"
    fi
}
