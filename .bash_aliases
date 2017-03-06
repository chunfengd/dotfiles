# echo 'bash_aliases'

# path
if [ -x /usr/libexec/path_helper ]; then
    eval `/usr/libexec/path_helper -s`
fi

export PATH=$HOME/bin:$PATH

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

# for emacs
if [ $INSIDE_EMACS ] && [ $TERM == dumb ]; then
    echo "inside dumb emacs"
    export NODE_NO_READLINE=1
fi
export ALTERNATE_EDITOR=
alias ecn='emacsclient -n'
alias ec='emacsclient'
alias ecnw='emacsclient -nw'
export SUDO_EDITOR=emacsclient # use "sudo -e <file>" for sudo editing

# for r
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# for time
alias unix2date='date -jf "%s" +"%Y-%m-%d %H:%M:%S"'
alias date2unix='date -jf "%Y-%m-%d %H:%M:%S" +%s'

# for git
alias egit='GIT_EDITOR='\''emacsclient -c'\'' git'
source ~/git-completion.bash
green="\[\033[0;32m\]"
blue="\[\033[0;34m\]"
purple="\[\033[0;35m\]"
reset="\[\033[0m\]"
source ~/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
# '\u' adds the name of the current user to the prompt
# '\$(__git_ps1)' adds git-related stuff
# '\W' adds the name of the current directory
export PS1="$purple\u$green\$(__git_ps1)$purple \W $ $reset"

###################
# platform
###################

###################
# device
###################

export PATH=/Applications/Emacs.app/Contents/MacOS:/Applications/Emacs.app/Contents/MacOS/bin:$PATH

# java_home
if [ -x /usr/libexec/java_home ]; then
    export JAVA_HOME="$(/usr/libexec/java_home -v 1.7)"
fi

###################
# for local
###################
if [ -r $HOME/.bash_local ]; then
    source $HOME/.bash_local
fi
