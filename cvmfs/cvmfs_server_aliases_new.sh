#!/bin/bash

export CVMFS_CONTAINER_BASE_IMAGE_NAME=slidspitfire/cvmfs-stratum0-base

function cvmfs_server_container {
    MODE=$1

    case "$MODE" in
    # Option to build the base container image
    build)  
        rm -f build.log

        echo -n "Building cvmfs stratum0 base image with name $CVMFS_CONTAINER_BASE_IMAGE_NAME... "
        docker build -t $CVMFS_CONTAINER_BASE_IMAGE_NAME . >> build.log
        echo "done"

        ln -sf build.log last-operation.log
        ;;

    # Option to execute the base image
    run)    
        rm -f run.log

        export HOST_CVMFS_ROOT_DIR=${2:-/var/cvmfs-docker/stratum0}
        export ENV_FILE=${3:-../cvmfs-variables.env}

        echo "Running cvmfs stratum0 docker container as cvmfs-stratum0 with:"
        echo -e "\t- Host cvmfs dir = $HOST_CVMFS_ROOT_DIR"
        echo -e "\t- Env file = $ENV_FILE"
        sh Dockerrun-args.sh "$HOST_CVMFS_ROOT_DIR" "$CVMFS_CONTAINER_BASE_IMAGE_NAME" "$ENV_FILE" >> run.log
        echo "done"

        ln -sf run.log last-operation.log
        ;;

    # Option to initialize the required repo[s] using the internal script and committing the new image on top of the existing
    mkfs)
        rm -f initrepo.log

        if [[ -z "$2" ]]; then
            echo "FATAL: no repository name provided as second argument or missing host cvmfs root directory or env file."
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

        export HOST_CVMFS_ROOT_DIR=${2:-/var/cvmfs-docker/stratum0}
        export ENV_FILE=${3:-../cvmfs-variables.env}

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
        echo -e "usage: cvmfs_server_container <command> [<args>]\n\n"
        echo "The most commonly used cvmfs_server_container commands are:"
        echo -e "\t- cvmfs_server_container build : build the base container image for stratum0"
        echo -e "\t- cvmfs_server_container run [output_image_name] [host_cvmfs_root_dir] [env_file]: build the base container image for stratum0"
        echo -e "\t- cvmfs_server_container initrepo <repo_name1>,[repo_name2,...] : configure the running container to host the list of repos and commit the configured container image"
        echo -e "\t- cvmfs_server_container recover <repo_name1>,[repo_name2,...] : recovers the provided repositories in a container that has been killed and restarted"
        echo -e "\t- cvmfs_server_container regenerate <repo_name1>,[repo_name2,...] : recovers existing repos' data in a new container instance (e.g. after a 'docker container prune')"
        ;;
    
    # Option to forward commands to cvmfs_server software running inside the container
    *)  
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
        ;;

    esac
}
