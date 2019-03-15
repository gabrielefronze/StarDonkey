#!/bin/bash
sh ./cvmfs-variable.env

function cvmfs_server {
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
