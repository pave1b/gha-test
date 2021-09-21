#!/bin/bash

# CI Server REST API URL
REST=https://cloud.all-hw.com/ci
# Verbose output on REST API requests/responses: either "-v" or empty
VERBOSE=

TOKEN=`curl -X POST -F firmware=$INPUT_BINARY -F input=$INPUT_FILE $VERBOSE "$REST/usertask?timeout=$INPUT_TIMEOUT&key=$INPUT_API_KEY" 2>/dev/null`

curl -X GET $VERBOSE "$REST/usertask?id=$TOKEN 2>/dev/null"

exit 0
