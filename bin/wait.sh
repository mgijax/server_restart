#!/bin/sh

# This function will wait for a given flag file to exist before continuing.
# It is used by any start script that needs to wait for a process on another
# server to be started first, such as a database.

WAIT_TIME=15

waitFor ()
{
    if [ $# -ne 1 ]
    then
        echo "Usage: waitFor flag"
        exit 1
    fi

    while [ 1 ]
    do
        if [ ! -f $1 ]
        then
            sleep ${WAIT_TIME}
            continue
        fi
        break
    done
}
