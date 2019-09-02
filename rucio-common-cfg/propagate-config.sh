#! /bin/bash

PREFIX="../"
DIRS=("rucio-server" "rucio-server-custom-branch" "rucio-client" "rucio-client-custom-branch" "rucio-ui")

echo

for((i=0;i<${#DIRS[@]};i++))
do
    FILE_PATH="$PREFIX${DIRS[i]}"
    echo "Copying to: $FILE_PATH"
    rm -rf "$FILE_PATH/rucio.cfg" "$FILE_PATH/rucio.conf"

    if grep -q "rucio.cfg" "$FILE_PATH/Dockerfile"; then
        cp ./rucio.cfg "$FILE_PATH/rucio.cfg"
        echo "               -> rucio.cfg"
    fi
    
    if grep -q "rucio.conf" "$FILE_PATH/Dockerfile"; then
        cp ./rucio.conf "$FILE_PATH/rucio.conf"
        echo "               -> rucio.conf"
    fi

    echo
done