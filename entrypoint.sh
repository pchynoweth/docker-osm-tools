#!/usr/bin/env bash

user=$(ls -dl . | awk '{ print $3; }')

if [ "$user" == "root" ]; then
    echo "Using root"
    "$@"
else
    echo "Using non-privileged user"
    addgroup --gid $(ls -dl . | awk '{ print $4; }') user
    useradd --uid $user -g user user
    sudo -u user "$@"
fi
