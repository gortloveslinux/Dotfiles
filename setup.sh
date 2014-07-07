#!/bin/bash

WORKING_DIR=$(dirname $0)/
ME=$(basename $0)

git submodule init && git submodule update

rsync -a --exclude=.git* --exclude=${ME} $WORKING_DIR ~
