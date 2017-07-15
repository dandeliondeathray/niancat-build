#!/bin/bash

echo -n "Sleeping 10 seconds, hoping the master will be up..."
sleep 10
echo " done"
buildbot-worker create-worker . buildbot:9989 niancat-micro-worker $WORKERPASS
exec buildbot-worker start --nodaemon
