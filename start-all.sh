#!/bin/bash

set -e

#start the services if we're root
if [ $UID == 0 ] ; then
  	gosu cassandra cassandra &

    # Exec the command as NB_USER
    start.sh $*
else
    echo 'ERROR: You need to run as root if you want cassandra to start in the background' 1>&2
    exit 42
fi