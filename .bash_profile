#!/bin/bash

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# Add Git AutoCompletion
source ~/.git-completion.bash

# Add Maven AutoCompletion
source ~/.mvn-completion.bash

export MANPATH=/opt/local/share/man:$MANPATH
export PAGER=most
export SVN_EDITOR=vim

# Alias
alias ll='ls -lGAhF'
alias cd..="cd .."
alias c="clear"
alias tree="tree -C"

# Java
export JAVA_HOME=/Library/Java/Home

# Maven
export MAVEN_HOME="/usr/share/maven"
export MAVEN_OPTS="-Xms256m -Xmx512m -XX:MaxPermSize=256m"

# Colorize Maven Output
if which mvn &> /dev/null; then
        color_maven()
        {
                local e=$(echo -e "\x1b")[
                local highlight="1;32m"
                local debug="1;32m"
                local info="1;36m"
                local warn="1;33m"
                local error="1;31m"

                `which mvn` $* | sed -e "s/Tests run: \([^,]*\), Failures: \([^,]*\), Errors: \([^,]*\), Skipped: \([^,]*\)/${e}${highlight}Tests run: \1${e}0m, Failures: ${e}${error}\2${e}0m, Errors: ${e}${warn}\3${e}0m, Skipped: ${e}${info}\4${e}0m/g" \
                        -e "s/\(\[WARN\].*\)/${e}${warn}\1${e}0m/g" \
						-e "s/\(\[WARNING].*\)/${e}${warn}\1${e}0m/g" \
                        -e "s/\(\[INFO\].*\)/${e}${info}\1${e}0m/g" \
                        -e "s/\(\[DEBUG\].*\)/${e}${debug}\1${e}0m/g" \
                        -e "s/\(\[ERROR\].*\)/${e}${error}\1${e}0m/g"
        }
        # Keep maven for interactive command
        alias maven="$MAVEN_HOME/bin/mvn"
        alias mvn="color_maven"
fi


# JBoss
export JBOSS_EAP_5="/Users/laborie/Documents/Servers/JBoss/JBoss-EAP-5.1.0/jboss-eap-5.1/jboss-as"
export JBOSS_AS_5="/Users/laborie/Documents/Servers/JBoss/jboss-5.1.0.GA"
export JBOSS_AS_6="/Users/laborie/Documents/Servers/JBoss/jboss-6.1.0.Final"
export JBOSS_AS_7="/Users/laborie/Documents/Servers/JBoss/jboss-as-7.1"
export JBOSS_HOME=$JBOSS_AS_7

#export JBOSS_CONF="standalone"
export JBOSS_CONF="production"

# PostgreSQL
export PG_HOME="/usr/local/pgsql"
export PGDATA="/usr/local/pgsql/data/"
# export PG_HOME="/Library/PostgreSQL8"

# MySQL
alias mysql=/usr/local/mysql/bin/mysql
alias mysqladmin=/usr/local/mysql/bin/mysqladmin

# Tomcat
export CATALINA_HOME="/Users/laborie/Documents/Servers/Tomcat/tomcat"

# Play!
export PLAY_HOME="/Users/laborie/Applications/play-2.0-beta"

# PATH
export PATH="$PG_HOME/bin:$MAVEN_HOME/bin:$PG_HOME/bin:$PLAY_HOME/:$PATH"

# Emplacement du chromedriver
export CHOME_WEB_DRIVER="/usr/local/bin/chromedriver"

##################
# Configure prompt
# see https://github.com/nicolargo/dotfiles/blob/master/_bashrc.d/bashrc_prompt

# Colors
NoColor="\033[0m"
Cyan="\033[0;36m"
Green="\033[0;32m"
Red="\033[0;31m" 
Yellow="\033[0;33m"

# Chars
RootPrompt="#"
NonRootPrompt="$"

# Contextual prompt
prompt() {
	USERNAME=`whoami`
	HOSTNAME=`hostname`
	CURRENTPATH=`pwd | sed "s|$HOME|~|g"`

	LEFTPROMPT=$Cyan$USERNAME@$HOSTNAME":"$Yellow$CURRENTPATH

	RIGHTPROMPT=""
	GITSTATUS=$(git status 2> /dev/null)
	#echo $GITSTATUS > /dev/null 2>&1 
	if [ $? -eq 0 ]; then
		echo $GITSTATUS | grep "not staged" > /dev/null 2>&1
		if [ $? -eq 0 ]; then
			RIGHTPROMPT=$Red
		else
			RIGHTPROMPT=$Green
		fi
		BRANCH=`git describe --contains --all HEAD`
		RIGHTPROMPT=$RIGHTPROMPT" [Git branch "$BRANCH"]"
	fi
	RIGHTPROMPT=$RIGHTPROMPT$NoColor

	echo -e -n "\n"$LEFTPROMPT
	echo -e $RIGHTPROMPT
}

# Define PROMPT_COMMAND if not already defined (fix: Modifying title on SSH connections)
if [ -z "$PROMPT_COMMAND" ]; then
	case $TERM in
	xterm*)
		PROMPT_COMMAND='printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"'
	;;
	screen)
		PROMPT_COMMAND='printf "\033]0;%s@%s:%s\033\\" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"'
	;;
	esac
fi
 
# Main prompt
PROMPT_COMMAND="prompt;$PROMPT_COMMAND"
 
if [ $EUID -ne 0 ]; then
	PS1=$NonRootPrompt" "
else
	PS1=$RootPrompt" "
fi
####################


# Configure proxy
if [ -f  ~/.bash_proxy.sh ]; then
	source ~/.bash_proxy.sh
fi

# Go to HOME
cd $HOME 
