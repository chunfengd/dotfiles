#!/bin/bash

t=`date +%s`
backup_dir="$HOME/.backup"
dst_dir=$HOME

pairs=()
pairs+=("bash_aliases .bash_aliases")
pairs+=("inputrc .inputrc")
pairs+=("zsh_aliases .zsh_aliases")
pairs+=("profile .profile")

# git
pairs+=("git-completion.bash git-completion.bash")
pairs+=("git-prompt.sh git-prompt.sh")
pairs+=("bash_git .bash_git")
pairs+=("git-completion.zsh git-completion.zsh")
pairs+=("zsh_git .zsh_git")

if [ ! -d $BINDING_PATH ]; then
    echo "create backcup dir: $backup_dir"
    mkdir -p $backup_dir
fi

for i in ${!pairs[@]}; do
    pair=(${pairs[$i]})
    src=${pair[0]}
    dst=${pair[1]}
    # echo $src $dst
    file=$dst_dir/$dst
    if [ -e $file ]; then
        backup_file=$backup_dir/$src.$t
        echo "backup $file to $backup_file"
        cp $file $backup_file
    fi
    echo "link $file to $PWD/$src"
    ln -sf $PWD/$src $file
done

# mac keybindings
if [ $(uname) == 'Darwin' ]; then
    BINDING_PATH=$HOME/Library/KeyBindings
    BINDING_FILE=$BINDING_PATH/DefaultKeyBinding.dict
    BACKUP_FILE=$backup_dir/DefaultKeyBinding.dict.$t
    if [ ! -d $BINDING_PATH ]; then
        echo "mkdir $BINDING_PATH"
        mkdir $BINDING_PATH
    fi
    if [ -e $BINDING_FILE ]; then
        echo "backup $BINDING_FILE to $BACKUP_FILE"
        cp $BINDING_FILE $BACKUP_FILE
    fi
    echo "link $BINDING_FILE to $PWD/DefaultKeyBinding.dict"
    ln -f $PWD/DefaultKeyBinding.dict $BINDING_FILE
fi
