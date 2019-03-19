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
    sh Dockerrun-args.sh "$HOST_CVMFS_ROOT_DIR" "$NEW_IMAGE_NAME" "$ENV_FILE"
}


function cvmfs_server_container {
    MODE=$1

    case "$MODE" in
    build)  echo "Building cvmfs stratum0 base image with name slidspitfire/cvmfs-stratum0-base:latest... "
            docker build -t slidspitfire/cvmfs-stratum0-base:latest . >> build.log
            echo "DONE!"

            ln -s build.log last-operation.log
            ;;

    run)    IMAGE_NAME=${2:-slidspitfire/cvmfs-stratum0-base:latest}
            export HOST_CVMFS_ROOT_DIR=${3:-/var/cvmfs-docker/stratum0}
            export ENV_FILE=${4:-../cvmfs-variables.env}

            echo "Running cvmfs stratum0 docker container as cvmfs-stratum0 with:"
            echo -e "\t- Host cvmfs dir = $HOST_CVMFS_ROOT_DIR"
            echo -e "\t- Env file = $ENV_FILE"
            sh Dockerrun-args.sh "$HOST_CVMFS_ROOT_DIR" "$IMAGE_NAME" "$ENV_FILE" >> run.log
            echo "DONE!"

            ln -s run.log last-operation.log
            ;;

    initrepo)   if [[ -z "$2" || -z "$HOST_CVMFS_ROOT_DIR" || -z "$ENV_FILE" ]]; then
                    echo "FATAL: no repository name provided as second argument or missing host cvmfs root directory or env file."
                else
                    echo -n "Initializing $2 repository in cvmfs-stratum0 container... "
                    docker exec -ti cvmfs-stratum0 sh /etc/cvmfs-scripts/stratum0-init.sh "$2" >> initrepo.log
                    echo "DONE!"
                    
                    echo -n "Committing and running configured container image... "
                    commit_new_image "$2" >> initrepo.log
                    echo "DONE!"

                    echo -n "Mounting necessary directories... "
                    cvmfs_server_container recover "$2" >> initrepo.log
                    echo "DONE!"

                    ln -s initrepo.log last-operation.log
                fi
                ;;
    
    recover)    if [[ -z "$2" ]]; then
                    echo "FATAL: no repository name provided as second argument or missing host cvmfs root directory or env file."
            
                else
                    export HOST_CVMFS_ROOT_DIR=${2:-/var/cvmfs-docker/stratum0}
                    export ENV_FILE=${3:-../cvmfs-variables.env}

                    echo -n "Recovering $2 repository in cvmfs-stratum0 container..."
                    docker exec -ti cvmfs-stratum0 sh /etc/cvmfs-scripts/restore-kill-start.sh "$2" >> recover.log
                    echo "DONE!"
                    
                    ln -s recover.log last-operation.log
                fi
                ;;

    regenerate) if [[ -z "$2" ]]; then
                    echo "FATAL: no repository name provided as second argument or missing host cvmfs root directory or env file."

                else
                    echo -n "Building base cvmfs-stratum0 container if needed... "
                    cvmfs_server_container build >> regenerate.log
                    echo "DONE!"

                    echo -n "Running cvmfs stratum0 docker container as cvmfs-stratum0... "
                    cvmfs_server_container run cvmfs-stratum0-"$2" >> regenerate.log
                    echo "DONE!"

                    echo -n "Regenerating $2 repository in cvmfs-stratum0 container preserving existing data... "
                    docker exec -ti cvmfs-stratum0 sh /etc/cvmfs-scripts/restore-prune-start.sh "$2" >> regenerate.log
                    echo "DONE!"

                    echo -n "Committing and running configured container image... "
                    commit_new_image "$2" >> regenerate.log
                    echo "DONE!"

                    echo -n "Mounting necessary directories... "
                    cvmfs_server_container recover "$2" >> regenerate.log
                    echo "DONE!"

                    ln -s regenerate.log last-operation.log
                fi
                ;;

        help)   echo -e "usage: cvmfs_server_container <command> [<args>]\n\n"
            echo "The most commonly used cvmfs_server_container commands are:"
            echo -e "\t- cvmfs_server_container build : build the base container image for stratum0"
            echo -e "\t- cvmfs_server_container run [output_image_name] [host_cvmfs_root_dir] [env_file]: build the base container image for stratum0"
            echo -e "\t- cvmfs_server_container initrepo <repo_name> : configure the running container to host repo_name repo and commit the configured container image"
            echo -e "\t- cvmfs_server_container recover <repo_name> : recovers the repo_name repository in a container that has been killed and restarted"
            echo -e "\t- cvmfs_server_container regenerate <repo_name> : recovers existing repo_name data in a new container instance (e.g. after a 'docker container prune')"
            ;;
    
    *)  CVMFS_REPO_NAME="$2"

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
        ;;

    esac
}
