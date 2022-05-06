# path
if [ -x /usr/libexec/path_helper ]; then
    eval `/usr/libexec/path_helper -s`
fi

if [ -d /Applications/Emacs.app/Contents/MacOS/ ]; then
    export PATH=/Applications/Emacs.app/Contents/MacOS/bin:$PATH
fi

#java_home
if [ -x /usr/libexec/java_home ]; then
    export JAVA_HOME="$(/usr/libexec/java_home)"
fi

# for shell
export PS1='\u@\h:\W\$ '
alias ll='ls -lhF'
alias grep='grep --color=auto'
alias ndgrep='grep --exclude='\''*/node_modules/*'\'''
alias ndjsgrep='grep --exclude='\''*/node_modules/*'\'' --include=*.js'

find_func() {
    find . -name $1 2>/dev/null
}
alias findf=find_func
# grep_func() {
#   grep  --color=auto -i $*   2>/dev/null
#}
#alias grepf=grep_func
title() {
    # setup title for iterm
    # https://superuser.com/questions/419775/with-bash-iterm2-how-to-name-tabs
    echo -ne "\033]0;"$*"\007"
}

daemon() {
  $* >/dev/null 2>&1 &
}

# for emacs
export NODE_NO_READLINE=1
export ALTERNATE_EDITOR=
alias ecn='emacsclient -s emacs-server -n'
alias ec='emacsclient -s emacs-server'
alias ecnw='emacsclient -s emacs-server -nw'

# # for r
# export LC_CTYPE=en_US.UTF-8
# export LC_ALL=en_US.UTF-8

# for time
alias unix2date='date -jf "%s" +"%Y-%m-%d %H:%M:%S"'
alias date2unix='date -jf "%Y-%m-%d %H:%M:%S" +%s'

###################
# platform
###################

###################
# device
###################

###################
# for local
###################
if [ -r $HOME/.bash_local ]; then
    source $HOME/.bash_local
fi
