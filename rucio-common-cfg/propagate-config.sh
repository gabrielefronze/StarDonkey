#! /bin/bash

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"

PREFIX="$DIR/../"
DIRS=("rucio-server" "rucio-server-custom-branch" "rucio-client" "rucio-client-custom-branch" "rucio-ui")

echo

for((i=0;i<${#DIRS[@]};i++))
do
    FILE_PATH="$PREFIX${DIRS[i]}"
    echo "Copying to: $FILE_PATH"
    rm -rf "$FILE_PATH/rucio.cfg" "$FILE_PATH/rucio.conf"

    if grep -q "rucio.cfg" "$FILE_PATH/Dockerfile"; then
        cp "$DIR/rucio.cfg" "$FILE_PATH/rucio.cfg"
        echo "               -> rucio.cfg"
    fi
    
    if grep -q "rucio.conf" "$FILE_PATH/Dockerfile"; then
        cp "$DIR/rucio.conf" "$FILE_PATH/rucio.conf"
        echo "               -> rucio.conf"
    fi

    echo
done