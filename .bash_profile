export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# Add Git AutoCompletion
source ~/.git-completion.bash

# Alias
alias ll="ls -la"
alias cd..="cd .."
alias c="clear"
alias ctree="tree -C"

# Env
export PAGER=most

# PATH
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# Configure prompt
[[ $- == *i* ]]   &&   . ~/.git-prompt.sh
