#!/bin/bash

fs=".bash_aliases .inputrc"

# backup old files if exist
for f in $fs
do
    file=$HOME/$f
    if [ -e $file ]; then
        echo "backup $file to $file.old"
        cp -f $file $file.old
    fi
    echo "link $file to $PWD/$f"
    ln -sf $PWD/$f $file
done

# mac keybindings
if [ $(uname) == 'Darwin' ]; then
    BINDING_PATH=$HOME/Library/KeyBindings
    BINDING_FILE=$BINDING_PATH/DefaultKeyBinding.dict
    if [ ! -d $BINDING_PATH ]; then
        echo "mkdir $BINDING_PATH"
        mkdir $BINDING_PATH
    fi
    if [ -e $BINDING_FILE ]; then
        echo "backup $BINDING_FILE"
        cp -f $BINDING_FILE $BINDING_FILE.old
    fi
    echo "link $BINDING_FILE to $PWD/DefaultKeyBinding.dict"
    ln -f $PWD/DefaultKeyBinding.dict $BINDING_FILE
fi
