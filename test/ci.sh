#!/bin/bash

# CI Server REST API URL
REST=https://cloud.all-hw.com/ci
# Verbose output on REST API requests/responses: either "-v" or empty
VERBOSE=

P_2=$2
P_3=$3

task_status() {
    curl -X GET $VERBOSE "$REST/usertask?id=$P_2"
	echo
}

create_task() {
    curl -X POST -F firmware=$INPUT_BINARY -F input=$INPUT_FILE $VERBOSE "$REST/usertask?timeout=$INPUT_TIMEOUT&key=$INPUT_API_KEY"
}

case "$1" in
    status)
        task_status
        ;;
    task)
        create_task
        ;;
esac

exit 0
