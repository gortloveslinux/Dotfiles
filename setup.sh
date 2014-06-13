#!/bin/bash

FILES=".vim .config .bash_profile .bashrc .profile .bash_aliases bin"

BACKUP=~/.dotfile_bac.tar

if [ ! -f $BACKUP ]; then
  echo "Creating back up of exsisting files"
  tar -cf $BACKUP $FILES
fi

rsync -a $FILES ~
