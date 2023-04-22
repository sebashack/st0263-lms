#!/bin/bash

set -xeuf -o pipefail

ROOT="$( readlink -f "$( dirname "${BASH_SOURCE[0]}" )" )"
DOCKER_FILE="${ROOT}/docker-compose.yaml"

export MYSQL_DATA_DIR="${ROOT}/data"
export MYSQL_SCRIPTS_DIR="${ROOT}/scripts"

if [[ $1 == "up" ]]; then
    docker-compose --file "$DOCKER_FILE" up --detach
elif [[ $1 == "down" ]]; then
    docker-compose --file "$DOCKER_FILE" down
else
    echo "Invalid option. Pick out one of [up, down]"
    exit 1
fi
