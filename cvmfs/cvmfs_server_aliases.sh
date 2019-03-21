#!/bin/bash

# This file is subject to the terms and conditions defined by
# the Creative Commons BY-NC-CC standard and was developed by
# Gabriele Gaetano Fronzé and Sara Vallero.
# For abuse reports and other communications write to 
# <gabriele.fronze at to.infn.it>

export CVMFS_SERVER_GIT_URL=https://github.com/gabrielefronze/StarDonkey
export CVMFS_SERVER_LOCAL_GIT_REPO=~/StarDonkey/
export CVMFS_CONTAINER_BASE_IMAGE_NAME=slidspitfire/cvmfs-stratum0-base

function cvmfs_server_container {
    MODE=$1

    case "$MODE" in
    # Clone the remote git repo locally
    get)
        echo -n "Cloning git repo from $CVMFS_SERVER_GIT_URL in $CVMFS_SERVER_LOCAL_GIT_REPO... "
        git clone "$CVMFS_SERVER_GIT_URL" "$CVMFS_SERVER_LOCAL_GIT_REPO"
        echo "done"
        ;;
    # Option to build the base container image
    build)  
        rm -f build.log

        echo -n "Building cvmfs stratum0 base image with name $CVMFS_CONTAINER_BASE_IMAGE_NAME... "
        docker build -t "$CVMFS_CONTAINER_BASE_IMAGE_NAME" "$CVMFS_SERVER_LOCAL_GIT_REPO"/cvmfs/cvmfs-stratum0 >> build.log
        echo "done"

        ln -sf build.log last-operation.log
        ;;

    # Option to execute the base image
    run)    
        rm -f run.log

        HOST_CVMFS_ROOT_DIR=${2:-/var/cvmfs-docker/stratum0}

        echo "Running cvmfs stratum0 docker container as cvmfs-stratum0 with:"
        echo -e "\t- Host cvmfs dir = $HOST_CVMFS_ROOT_DIR"
        sh "$CVMFS_SERVER_LOCAL_GIT_REPO"/cvmfs/cvmfs-stratum0/Dockerrun-args.sh "$HOST_CVMFS_ROOT_DIR" "$CVMFS_CONTAINER_BASE_IMAGE_NAME" >> run.log
        echo "done"

        ln -sf run.log last-operation.log
        ;;

    # Option to initialize the required repo[s] using the internal script and committing the new image on top of the existing
    mkfs)
        rm -f initrepo.log

        if [[ -z "$2" ]]; then
            echo "FATAL: no repository name provided."
        else
            REQUIRED_REPOS="$2"
            REPO_NAME_ARRAY=$(echo $REQUIRED_REPOS | tr "," "\n")
            REQUIRED_REPOS_SUFFIX=$(echo $REQUIRED_REPOS | sed 's/\,/-/')

            for REPO_NAME in $REPO_NAME_ARRAY
            do
                echo -n "Initializing $REPO_NAME repository in cvmfs-stratum0 container... "
                docker exec -ti cvmfs-stratum0 cvmfs_server mkfs -o root "$REPO_NAME" >> initrepo.log
                docker exec -ti cvmfs-stratum0 cvmfs_server check "$REPO_NAME" >> initrepo.log
                echo "done"
            done

            ln -sf initrepo.log last-operation.log
        fi
        ;;
    
    # Option to recover the required repo[s] using the internal script
    mount)
        rm -f recover.log

        HOST_CVMFS_ROOT_DIR=${2:-/var/cvmfs-docker/stratum0}

        REPO_NAME_ARRAY=$(ls $HOST_CVMFS_ROOT_DIR/srv-cvmfs/ | tr " " "\n" | sed "/info/d")

        for REPO_NAME in $REPO_NAME_ARRAY
        do
            echo -n "Recovering $REPO_NAME repository in cvmfs-stratum0 container..."
            docker exec -ti cvmfs-stratum0 sh /etc/cvmfs-scripts/restore-repo.sh "$REPO_NAME" >> recover.log
            echo "done"
        done
        
        ln -sf recover.log last-operation.log
        ;;

    # Help option
    help)   
        echo -e "CernVM-FS Container Server Tool\n"
        echo -e "Usage: cvmfs_server_container COMMAND [options] <parameters>\n"
        echo -e "Supported commands:\n"
        echo -e "  get          Clone the git repo locally"
        echo -e "  build        Build the stratum0 container image"
        echo -e "  run          Runs the stratum0 container as cvmfs-stratum0"
        echo -e "  mkfs         <fully qualified repository name>,"
        echo -e "               [fully qualified repository name],..."
        echo -e "               Configures the running container"
        echo -e "               to host the provided repo or list"
        echo -e "               of repos with root as owner."
        echo -e "  mount        Mounts all the repositories found in"
        echo -e "               the host root path, automatically recovering"
        echo -e "               from crashes and shutdowns."
        echo
        echo -e "Please note that standard cvmfs_server commands are available."
        echo -e "________________________________________________________________________\n"
        ;;
    
    # Option to forward commands to cvmfs_server software running inside the container
    *)  
        CVMFS_REPO_NAME="$2"

        echo -e "\nThe operations will be performed on the repository $CVMFS_REPO_NAME"
        read -p "Press ENTER key to continue, Ctrl-C to abort..."
        echo -e "\n"

        docker exec -ti cvmfs-stratum0 cvmfs_server "$@"

        if [[ "$1" == "transaction" ]]; then
            mount -o remount,rw overlay_"$CVMFS_REPO_NAME"
        fi

        if [[ "$1" == "publish" ]]; then
            mount -o remount,ro overlay_"$CVMFS_REPO_NAME"
        fi

        unset CVMFS_REPO_NAME
        ;;

    esac
}
