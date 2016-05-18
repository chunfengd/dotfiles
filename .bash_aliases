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
export NODE_NO_READLINE=1
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

# alias for redis
alias redis_start='sudo redis-server /opt/local/etc/redis.conf &'
alias redis_stop='sudo kill $(pidof redis-server)'

# alias for postgres
alias postgres_start='sudo /opt/local/etc/LaunchDaemons/org.macports.postgresql93-server/postgresql93-server.wrapper start'
alias postgres_stop='sudo /opt/local/etc/LaunchDaemons/org.macports.postgresql93-server/postgresql93-server.wrapper stop'
alias postgres_restart='sudo /opt/local/etc/LaunchDaemons/org.macports.postgresql93-server/postgresql93-server.wrapper restart'

# alias for mongo server
alias mongo_start='sudo mongod -f /opt/local/etc/mongodb/mongodb.conf --httpinterface'
mongostop_func () {
  local mongopid=`less /opt/local/var/db/mongodb_data/mongod.lock`;
  if [[ $mongopid =~ [[:digit:]] ]]; then
      sudo kill -15 $mongopid;
      echo mongod process $mongopid terminated;
  else
      echo mongo process $mongopid not exist;
  fi
}
alias mongo_stop="mongostop_func"

# android
export ANDROID_HOME=$HOME/tools/android-sdk-macosx
#export NDK_HOME=$HOME/tools/android-ndk-r10
#export PATH=$PATH:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools:$NDK_HOME
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/build-tools/current
export PATH=$PATH:$ANDROID_HOME/platform-tools
#export OPENCV_ANDROID_HOME=$HOME/tools/OpenCV-2.4.9-android-sdk

# python
export PYTHON_HOME=/opt/local/Library/Frameworks/Python.framework/Versions/Current
export PATH=$PATH:$PYTHON_HOME/bin
export PYGUI_HOME=$HOME/tools/PyGUI-2.5.3
export PYTHONPATH=$PYGUI_HOME

# cmake
export CMAKE_HOME=/Applications/CMake.app/Contents
export PATH=$PATH:$CMAKE_HOME/bin
export CMAKE_PREFIX_PATH=/opt/chunfeng

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
