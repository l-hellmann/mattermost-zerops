#!/bin/bash

if [ -f migrate ]; then
    exit 0
fi

mattermost db migrate -c config.json

touch migrate