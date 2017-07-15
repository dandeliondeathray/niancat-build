#!/bin/bash

buildbot-worker create-worker . buildbot:8080 niancat-micro-worker $WORKERPASS
exec buildbot-worker start
