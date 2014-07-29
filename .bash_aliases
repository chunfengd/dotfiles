# path
if [ -x /usr/libexec/path_helper ]; then
    eval `/usr/libexec/path_helper -s`
fi
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export PATH=$HOME/bin:$PATH

#java_home
if [ -x /usr/libexec/java_home ]; then
    export JAVA_HOME="$(/usr/libexec/java_home)"
fi

# for shell
export PS1='\u@\h:\W\$ '
alias ll='ls -lhFG'
alias grep='grep --color=auto'

# for emacs
export NODE_NO_READLINE=1
export ALTERNATE_EDITOR=
alias ec='emacsclient -c'
export SUDO_EDITOR=emacsclient # use "sudo -e <file>" for sudo editing

# for r
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# for time
alias unix2date='date -jf "%s" +"%Y-%m-%d %H:%M:%S"'
alias date2unix='date -jf "%Y-%m-%d %H:%M:%S" +%s'

# for local
if [ -r $HOME/.bash.local ]; then
    source $HOME/.bash.local
fi
