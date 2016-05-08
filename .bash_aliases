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
alias egit='GIT_EDITOR='\''emacsclient -c'\'' git'
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

###################
# platform
###################

# emacs gui
export PATH=/Applications/Emacs.app/Contents/MacOS/bin:$PATH

###################
# device
###################

# sqrrl
ulimit -n 65536

export RUBY_VERSION=1.9.3-p551
export PATH="$HOME/.rbenv/bin:$HOME/.rbenv/versions/${RUBY_VERSION}/bin:$PATH"
eval "$(rbenv init -)"

export JAVA_HOME="$(/usr/libexec/java_home)"
export MAVEN_OPTS='-Xms512m -Xmx2g -XX:MaxPermSize=256m'

export CLOUD_HOME=/Users/chunfeng/cloud
export CLOUD_DATA_HOME=$CLOUD_HOME/data
export HADOOP_HOME=$CLOUD_HOME/lib/hadoop-2.6.4
export ZOOKEEPER_HOME=$CLOUD_HOME/lib/zookeeper-3.4.8
export ZOO_LOG_DIR=$CLOUD_HOME/log/zookeeper
export SQRRL_REPO=$CLOUD_HOME/sqrrl
export SQRRL_HOME=$CLOUD_HOME/sqrrl
export SQRRL_PREFIX=$CLOUD_HOME/sqrrl

export PATH=$PATH:$CLOUD_HOME/bin:$HADOOP_HOME/bin:$SQRRL_HOME/analytics/bin
alias start_web='mvn -f /cloud/sqrrl/web/pom.xml -Dcheckstyle.skip=true antrun:run'
alias start_web_no_tests='mvn -f /cloud/sqrrl/web/pom.xml -Dcheckstyle.skip=true -DskipTests antrun:run'

# antlr
export ANTLR_JAR=/Users/chunfeng/cloud/lib/antlr/antlr-4.5.3-complete.jar
export CLASSPATH=".:$ANTLR_JAR:$CLASSPATH"
alias antlr4='java -jar $ANTLR_JAR'
alias grun='java org.antlr.v4.runtime.misc.TestRig'

###################
# for local
###################

if [ -r $HOME/.bash_local ]; then
    source $HOME/.bash_local
fi
