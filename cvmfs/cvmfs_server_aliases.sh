#!/bin/bash

# This file is subject to the terms and conditions defined by
# the Creative Commons BY-NC-CC standard and was developed by
# Gabriele Gaetano Fronzé and Sara Vallero.
# For abuse reports and other communications write to 
# <gabriele.fronze at to.infn.it>

export CVMFS_SERVER_GIT_URL=https://github.com/gabrielefronze/StarDonkey
export CVMFS_SERVER_LOCAL_GIT_REPO=~/StarDonkey/
export CVMFS_CONTAINER_BASE_IMAGE_NAME=slidspitfire/cvmfs-stratum

function cvmfs_server_container {
    MODE=$1

    case "$MODE" in
    # Clone the remote git repo locally
    get)
        echo -n "Cloning git repo from $CVMFS_SERVER_GIT_URL in $CVMFS_SERVER_LOCAL_GIT_REPO... "
        if [[ ! -d "$CVMFS_SERVER_LOCAL_GIT_REPO"/.git ]]; then
            git clone "$CVMFS_SERVER_GIT_URL" "$CVMFS_SERVER_LOCAL_GIT_REPO"
        else
            git pull "$CVMFS_SERVER_LOCAL_GIT_REPO"
        fi
        echo "done"
        ;;
    # Option to build the base container image
    build)  
        rm -f build.log

        STRATUM="dummy"
        
        if [[ ( ! -z $2 ) && ( "$2"==0 || "$2"==1 )]]; then
            STRATUM="$2"
        else
            echo "FATAL: provided option $2 not recognized. Please select [0/1]."
            exit 1
        fi

        IMAGE_NAME="$CVMFS_CONTAINER_BASE_IMAGE_NAME""$STRATUM"-base

        echo -n "Building cvmfs stratum$STRATUM base image with name $IMAGE_NAME... "
        docker build -t "$IMAGE_NAME" "$CVMFS_SERVER_LOCAL_GIT_REPO"/cvmfs/cvmfs-stratum"$STRATUM" >> build.log
        echo "done"

        ln -sf build.log last-operation.log
        ;;

    # Option to execute the base image
    run)    
        rm -f run.log

        HOST_CVMFS_ROOT_DIR=${3:-/var/cvmfs-docker/stratum0}
        STRATUM="dummy"

        if [[ ( ! -z $2 ) && ( "$2"==0 || "$2"==1 )]]; then
            STRATUM="$2"
        else
            echo "FATAL: provided option $2 not recognized. Please select [0/1]."
            exit 1
        fi

        IMAGE_NAME="$CVMFS_CONTAINER_BASE_IMAGE_NAME""$STRATUM"-base

        echo "Running cvmfs stratum$STRATUM docker container as cvmfs-stratum0 with:"
        echo -e "\t- Host cvmfs dir = $HOST_CVMFS_ROOT_DIR"
        sh "$CVMFS_SERVER_LOCAL_GIT_REPO"/cvmfs/cvmfs-stratum"$STRATUM"/Dockerrun-args.sh "$HOST_CVMFS_ROOT_DIR" "$IMAGE_NAME" >> run.log
        echo "done"

        ln -sf run.log last-operation.log
        ;;

    # Option to initialize the required repo[s] using the internal script and committing the new image on top of the existing
    mkfs-list)
        rm -f initrepo.log

        if [[ -z "$2" ]]; then
            echo "FATAL: no repository name provided."
            exit 1
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

        if [[ "$2" == "-a" || -z "$2" ]]; then
            HOST_CVMFS_ROOT_DIR=${3:-/var/cvmfs-docker/stratum0}

            REPO_NAME_ARRAY=$(ls $HOST_CVMFS_ROOT_DIR/srv-cvmfs/ | tr " " "\n" | sed "/info/d")

            for REPO_NAME in $REPO_NAME_ARRAY
            do
                echo -n "Recovering $REPO_NAME repository in cvmfs-stratum0 container... "
                docker exec -ti cvmfs-stratum0 sh /etc/cvmfs-scripts/restore-repo.sh "$REPO_NAME" >> recover.log
                echo "done"
            done
        else
            REQUIRED_REPOS="$2"
            REPO_NAME_ARRAY=$(echo $REQUIRED_REPOS | tr "," "\n")
            REQUIRED_REPOS_SUFFIX=$(echo $REQUIRED_REPOS | sed 's/\,/-/')

            for REPO_NAME in $REPO_NAME_ARRAY
            do
                echo -n "Recovering $REPO_NAME repository in cvmfs-stratum0 container... "
                docker exec -ti cvmfs-stratum0 sh /etc/cvmfs-scripts/restore-repo.sh "$REPO_NAME" >> recover.log
                echo "done"
            done
        fi
        
        ln -sf recover.log last-operation.log
        ;;

    # Help option
    help)   
        echo -e "CernVM-FS Container Server Tool\n"
        echo -e "Usage: cvmfs_server_container COMMAND [options] <parameters>\n"
        echo -e "Supported commands:\n"
        echo -e "  get          Clone the git repo locally"
        echo -e "  build        [0/1]"
        echo -e "               Build the stratum[0/1] container image"
        echo -e "  run          [0/1]"
        echo -e "               Runs the stratum[0/1] container as cvmfs-stratum[0/1]"
        echo -e "  mkfs-list    <fully qualified repository name>,"
        echo -e "               [fully qualified repository name],..."
        echo -e "               Configures the running container"
        echo -e "               to host the provided repo or list"
        echo -e "               of repos with root as owner."
        echo -e "  mount        [-a]"
        echo -e "               Mounts all the repositories found in"
        echo -e "               the host root path, automatically recovering"
        echo -e "               from crashes and shutdowns."
        echo -e "  mount        <fully qualified repository name>,"
        echo -e "               [fully qualified repository name],..."
        echo -e "               Mounts the specified repo or list of repos found in"
        echo -e "               the host root path, automatically recovering them"
        echo -e "               from crashes and shutdowns."
        echo
        echo -e "Please note that standard cvmfs_server commands are available."
        echo -e "________________________________________________________________________\n"
        ;;
    
    # Option to forward commands to cvmfs_server software running inside the container
    *)  
        CVMFS_REPO_NAME="$2"

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
