#!/bin/bash

function commit_new_image {
     NEW_IMAGE_NAME=cvmfs-stratum0-"$1"

    echo "Committing new cvmfs-stratum0 container..."
    docker commit cvmfs-stratum0 "$NEW_IMAGE_NAME"

    echo "Removing old cvmfs-stratum0 container..."
    docker rm -f cvmfs-stratum0

    echo "Running newly configured cvmfs-stratum0 container with:"
    echo -e "\t- Host cvmfs dir = $HOST_CVMFS_ROOT_DIR"
    echo -e "\t- Env file = $ENV_FILE"
    read -p "Press ENTER key to continue, Ctrl-C to abort..."
    sh Dockerrun-args.sh "$HOST_CVMFS_ROOT_DIR" "$NEW_IMAGE_NAME" "$ENV_FILE"
}


function cvmfs_server_container {
    if [[ "$1" == "build" ]]; then
        echo "Building cvmfs stratum0 base image with name slidspitfire/cvmfs-stratum0-base:latest... "
        read -p "Press ENTER key to continue, Ctrl-C to abort..."
        docker build -t slidspitfire/cvmfs-stratum0-base:latest .
        echo "DONE!"

    elif [[ "$1" == "run" ]]; then
        export HOST_CVMFS_ROOT_DIR=${2:-/var/cvmfs-docker/stratum0}
        export ENV_FILE=${3:-../cvmfs-variables.env}

        echo "Running cvmfs stratum0 docker container as cvmfs-stratum0 with:"
        echo -e "\t- Host cvmfs dir = $HOST_CVMFS_ROOT_DIR"
        echo -e "\t- Env file = $ENV_FILE"
        read -p "Press ENTER key to continue, Ctrl-C to abort..."
        sh Dockerrun-args.sh "$HOST_CVMFS_ROOT_DIR" slidspitfire/cvmfs-stratum0-base:latest "$ENV_FILE"
        echo "DONE!"

    elif [[ "$1" == "initrepo" ]]; then
        if [[ -z "$2" || -z "$HOST_CVMFS_ROOT_DIR" || -z "$ENV_FILE" ]]; then
            echo "FATAL: no repository name provided as second argument or missing host cvmfs root directory or env file."
        else
            echo "Initializing $2 repository in cvmfs-stratum0 container..."
            docker exec -ti cvmfs-stratum0 sh /etc/cvmfs-scripts/stratum0-init.sh "$2"
            
            commit_new_image "$2"

            cvmfs_server_container recover "$2"
        fi

    elif [[ "$1" == "recover" ]]; then
        if [[ -z "$2" ]]; then
            echo "FATAL: no repository name provided as second argument or missing host cvmfs root directory or env file."
            
        else
            export HOST_CVMFS_ROOT_DIR=${2:-/var/cvmfs-docker/stratum0}
            export ENV_FILE=${3:-../cvmfs-variables.env}

            echo "Recovering $2 repository in cvmfs-stratum0 container..."
            docker exec -ti cvmfs-stratum0 sh /etc/cvmfs-scripts/restore-kill-start.sh "$2"
            
        fi
        

    elif [[ "$1" == "regenerate" ]]; then
        if [[ -z "$2" ]]; then
            echo "FATAL: no repository name provided as second argument or missing host cvmfs root directory or env file."

        else
            cvmfs_server_container build

            cvmfs_server_container run

            echo "Regenerating $2 repository in cvmfs-stratum0 container..."
            docker exec -ti cvmfs-stratum0 sh /etc/cvmfs-scripts/restore-prune-start.sh "$2"

            commit_new_image "$2"

            cvmfs_server_container recover "$2"

        fi        

    else
        CVMFS_REPO_NAME="$2"

        echo -e "\nThe operations will be performed on the repository $CVMFS_REPO_NAME"
        read -p "Press ENTER key to continue, Ctrl-C to abort..."
        echo -e "\n"

        docker exec -ti cvmfs-stratum0 cvmfs_server $@

        if [[ "$1" == "transaction" ]]; then
            mount -o remount,rw overlay_"$CVMFS_REPO_NAME"
        fi

        if [[ "$1" == "publish" ]]; then
            mount -o remount,ro overlay_"$CVMFS_REPO_NAME"
        fi

        unset CVMFS_REPO_NAME
    fi
}
