# path
if [ -x /usr/libexec/path_helper ]; then
    eval `/usr/libexec/path_helper -s`
fi
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export PATH=$HOME/bin:$PATH

# for shell
export PS1='\h:\W \u\$ '
alias ll='ls -lahFG'
alias grep='grep -nI'
export JAVA_HOME=`/usr/libexec/java_home -v 1.6`

# for emacs
export NODE_NO_READLINE=1
export ALTERNATE_EDITOR=
alias ec='emacsclient -c'
export SUDO_EDITOR=emacsclient # use "sudo -e <file>" for sudo editing
