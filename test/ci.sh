#!/bin/bash

# CI Server REST API URL
REST=https://cloud.all-hw.com/ci
# Verbose output on REST API requests/responses: either "-v" or empty
VERBOSE=

TOC=`curl -X POST -F firmware=@./$INPUT_BINARY -F input=@./$INPUT_FILE $VERBOSE "$REST/usertask?timeout=$INPUT_TIMEOUT&key=$INPUT_API_KEY" 2>/dev/null`

OUT=
while [ "x$(echo "$OUT" | grep "\"status\":\"finished\"")" == "x" ]
do
    sleep 1
    OUT=`curl -X GET $VERBOSE "$REST/usertask?id=$TOC" 2>/dev/null`
done

echo "$OUT"
exit 0
