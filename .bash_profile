export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# Add Git AutoCompletion
source ~/.git-completion.bash

# Add Maven AutoCompletion
source ~/.mvn-completion.bash 

# Alias
alias ls='ls -h --color --group-directories-first'      # la couleur pour chaque type de fichier, les répertoires s'affichent en premier
alias lsa='ls -A'       # affiche les fichiers cachés
alias ll='ls -l'        # affiche en mode liste détail
alias lla='ls -Al'      # affiche en mode liste détail + fichiers cachés
alias lx='ls -lXB'      # tri par extension
alias lk='ls -lSr'      # tri par taille, le plus lourd à la fin
alias lc='ls -ltcr'     # tri par date de modification, la pus récente à la fin
alias lu='ls -ltur'     # tri par date d’accès, la pus récente à la fin
alias lt='ls -ltr'      # tri par date, la pus récente à la fin
alias lm='ls -al | more'        # Pipe a travers 'more'
alias lr='ls -lR'       # ls récurssif
alias tree='tree -Csu'  # affciche sous forme d'arborescence, nécessite le paquet "tree"
alias voirlog='tail -f' # affiche les dernière d'un fichier log (par exemple) en live
alias df='df -kTh'      # commande df avec l'option -human
alias du='du -kh'       # commande du avec l'option -human
alias du1='du -kh --max-depth=1'        # commande du avec l'option -human, au niveau du répertoire courant
alias free='free -m'    # commande free avec l'option affichage en Mo
alias rm='rm -i'        # confirmation si écrasement de fichiers lors de renommage d'un fichier
alias cp='cp -i'        # confirmation si écrasement de fichiers lors de copie de fichier
alias mv='mv -i'                # confirmation si écrasement de fichiers lors de déplacement de fichier
alias top='htop'                # nécessite le paquet "htop", un top amélioré et en couleur
alias shistory='history | grep '        # faire une recherche dans l'historique de commande
alias h='history'              # raccourci history
alias mkdir='mkdir -p'  # pour éviter l'écrasement lors de création de dossier
alias ..='cd ..'        # raccourci répertoire parent
alias path='echo -e ${PATH//:/\\\\n}'     # affiche le path des exec
alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\\\n}'       # affiche le path des lib
alias vi='vim'  # la commande vi en couleurs (http://www.taltan.fr/post/2006/10/29/47-coloration-syntaxique-dans-vi)
alias c='clear' # raccourci commande clear
alias ping='ping -c 4'    # raccourci commande ping avec 4 occurrences

# PATH
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# Configure prompt
[[ $- == *i* ]]   &&   . ~/.git-prompt.sh

# Env
export PAGER=most
export HISTTIMEFORMAT="%Y/%m/%d_%T : "
cd $HOME
