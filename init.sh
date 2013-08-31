#!/bin/bash

fs=".profile .bashrc .inputrc"

# backup old files if exist
for f in $fs
do
    file=$HOME/$f
    if [ -e $file ]; then
        echo "backup $file to $file.old"
        mv -f $file $file.old
    fi

    if [ -h $file ]; then
        echo "remove link $file"
        rm -f $file
    fi

    echo "link $file to $PWD/$f"
    ln -s $PWD/$f $file
done
