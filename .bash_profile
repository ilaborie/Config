export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# Add Git AutoCompletion
source ~/.git-completion.bash

# Add Maven AutoCompletion
source ~/.mvn-completion.bash 

# Alias
alias ll="ls -la"
alias cd..="cd .."
alias c="clear"
alias ctree="tree -C"
alias grep="grep --color=auto"

# Env
export PAGER=most

# PATH
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# Configure prompt
[[ $- == *i* ]]   &&   . ~/.git-prompt.sh
