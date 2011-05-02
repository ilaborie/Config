export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# Add Git AutoCompletion
source ~/.git-completion.bash

export MANPATH=/opt/local/share/man:$MANPATH
export PAGER=most


# Alias
alias ll='ls -lGAhF'
alias cd..="cd .."
alias c="clear"
alias gvim="/Applications/MacVim.app/Contents/MacOS/MacVim"

# Java
# export JAVA_HOME="/Users/euqos/Documents/igor/java-1.6"
export JAVA_HOME=/Library/Java/Home

# Maven
export M2="Users/euqos/Documents/igor/tools/apache-maven-2.2.1"
#export M3="/Users/euqos/Documents/igor/tools/apache-maven-3.0.1"
export M3="/Users/euqos/Applications/mvnsh-1.0.1"

export MAVEN_HOME=$M3
export MAVEN_OPTS="-Xms256m -Xmx512m -XX:MaxPermSize=256m"

# JBoss
export JBOSS_HOME="/Users/euqos/Applications/EnterpriseApplication-5.1/jboss-eap-5.1/jboss-as"
export JBOSS_CONF="default"

# PostgreSQL
export PG_HOME="/Library/PostgreSQL8"

# Tomcat
export CATALINA_HOME="/Users/euqos/Applications/tomcat"

# PATH
export PATH="$MAVEN_HOME/bin:$PG_HOME/bin:$PATH"


# Configure prompt
[[ $- == *i* ]]   &&   . ~/.git-prompt.sh