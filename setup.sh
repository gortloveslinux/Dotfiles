#!/bin/bash

FILES=".todo.cfg .inputrc .vim .vimrc .config .bash_profile .bashrc .profile .bash_aliases bin"

rsync -a $FILES ~
