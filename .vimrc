" EasyMotion est activable avec <Leader>m
" let g:EasyMotion_leader_key = '<Leader>m' 
" mise-à-jour automatique si le fichier en cours d'édition a été modifié ailleurs que dans Vim
set autoread

" encodage par défaut
set encoding=utf-8
set fileencoding=utf-8

" formats de fichiers pour lesquels l'autocomplétion est désactivée
set wildignore=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,=*.pyc,*~,*.tar,*.tgz

" accélère le rendu graphique dans les terminaux véloces
set ttyfast

" Afficher les numéro de ligne
set number

" le système d'exploitation décide à la place de Vim le bon moment pour vider le cache
set nofsync

" hauteur de la ligne de status (utile pour les plugins de library hints,
" notifications diverses et variées type mlint, VCS…)
set ch=2

" une ligne de status avec plus d'information !
" attention au %{VimBuddy()} qui nécessite le plugin VimBuddy
" et au VCS qui nécessite le plugin vcscommand
set laststatus=2

" conserve du contexte autour du curseur d'édition
set scrolloff=10
set sidescrolloff=3

" gestion des lignes longues (:help wrap)
set wrap
set sidescroll=5
set listchars+=precedes:<,extends:>


" pas de compatiblité avec vi afin d'activer les fonctionnalités de Vim
set nocompatible

" pas de bip! relou lors d'une erreur
" set noerrorbells

" ne PAS faire clignoter l'écran lors d'une erreur (relou^2)
set novisualbell

" active les plugins et les indentations par type de fichier
filetype on
filetype plugin indent on

" quand on tape par ex. un ")", Vim montre le "(" correspondant
set showmatch

" ajoute une marge à gauche pour afficher les +/- des replis (folds)
if has("gui_running")
    set foldcolumn=2
endif

" autorise le folding
set foldenable

" gestion de la souris en console
if !has("gui_running")
    set mouse=a
endif

" critère par défaut pour replier les blocs : marqueurs explicites {{{ … }}}
set foldmethod=marker

" indentation automatique
set autoindent

" des espaces à la place du caractère TAB
" :h tabstop pour les détails
set tabstop=4
set shiftwidth=4
set expandtab

" {{{ pour le plugin surround
" permet de redonner la main à vim pour gérer l'indentation automatique
let b:surround_indent = 1
" surround }}}

" ignorer la casse des caractères dans les recherches de chaînes
set ignorecase

" mais ne pas l'ignorer s'il y a explicitement des majuscules
set scs

" regexp version magic
set magic

" recherche circulaire (pour couvrir tout le fichier, quel que soit le point
" de départ de la recherche)
set wrapscan

" résultats dynamiques au cours de la recherche (amène le curseur sur le
" résultat pour le motif actuellement recherché)
set sm

" surlignage des résultats
set hls

" … y compris en cours de frappe
set incsearch

" correction orthographique
" version Nemolivier
set nospell spelllang=fr

" F10 active/desactive la correction orthographique
function! ToggleSpell()
  if &spell
     set nospell
  else
     set spell
  end
endfunction
noremap <F10> :call ToggleSpell()<cr>
inoremap <F10> <Esc> :call ToggleSpell()<cr>
vnoremap <F10> <Esc> :call ToggleSpell()<cr>

" place le curseur là où il était lors de la fermeture du fichier
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

" la touche backspace peut supprimer tout et n'importe quoi, dans tous les modes
set backspace=2

" met en évidence la ligne actuellement éditée
if has("gui_running")
   set cursorline
endif

" auto-complete avec <tab>
function! TabAlign()
" Cette fonction, lorsqu'aucun mot n'est tapé, cherche à recopier le dernier caractère de la ligne d'avant
" Idéal pour aligner des backslash avant des retour à la ligne
    let col = col('.')
    let lnum = line('.')
" recherche de la première ligne ayant une longueur supérieure à la ligne courante
    while lnum > 1 " chercher la ligne
        let lnum = lnum - 1
        let ln = strpart(getline(lnum), col-1)
        let ms = matchstr(ln, '[^ ]* *[^ ]')
        if ms != ""
            break
        endif
    endwhile

    if lnum == 1
        return "\<Tab>"
    else
" Copie dans le registre z du dernier caractère de la ligne de longueur supérieure trouvée
        let @z = substitute(strpart(ms, 0, strlen(ms)-1), '.', ' ', 'g')
" Si au dernier caractère de la ligne :
        if col > strlen(getline('.'))
" Copie du registre z après le caractère courant (CTRL-O échappe du mode insertion pour une instruction)
            return "\<C-O>\"zp"
        else
" Copie du registre z avant le caractère courant (idem)
            return "\<C-O>\"zP"
        endif
    endif
endfunction

function! CleverTab()
    let c = strpart(getline('.'), col('.')-2, 1)
" Si aucun mot n'a été partiellement saisi
    if c == ' ' || c == '\t' || c == ''
" Utiliser la fonction précédente
        return TabAlign()
    else
" Complétion automatique
        return "\<C-P>"
    endif
endfunction

inoremap <Tab> <C-R>=CleverTab()<CR>
inoremap <S-Tab> <C-R>=TabAlign()<CR>

" <espace> deux fois en mode normal efface les messages et les résultats de recherche
nnoremap <silent> <Space><Space> :silent noh<Bar>echo<CR>

" expliciter les espaces insécables
set listchars=nbsp:·,tab:>-
set list

set wc=<TAB>

" show a list of all matches when tabbing a command
set wmnu

" how command line completion works
set wildmode=list:longest,list:full

" some filetypes got lower priority
set su=.h,.bak,~,.o,.info,.swp,.obj

" enhanced command-line completion mode
set wildmenu

" remember last 2000 typed commands
set hi=2000

" afficher la position du curseur
set ruler

" toujours afficher le mode courant
set showmode

" affichage dynamique des commandes
set showcmd

" utiliser des messages courts
set shm=a

" la ligne de status est toujours visible
set laststatus=2

" make all windows the same size when adding/removing windows
set noequalalways

" les nouvelles fenêtres sont crées sous l'actuelle
set splitbelow

" répertoire de sauvegarde automatique
" set backupdir=$HOME/.vim/backup

" activation de la sauvagarde
" set backup
set updatecount=0

let mapleader = ","
let g:mapleader = ","

" pratique pour ouvrir des fichiers, à défaut d'un auto-cd
map ,cd :cd %:p:h<CR>

" tout séléctionner
noremap <C-A> gggH<C-O>G
"inoremap <C-A> <C-O>gg<C-O>gH<C-O>G
cnoremap <C-A> <C-C>gggH<C-O>G

if has("gui_running")
" Shift-[flèche] pour sélectionner un bloc
    map <S-Up> vk
    vmap <S-Up> k
    map <S-Down> vj
    vmap <S-Down> j
    map <S-Right> v
    vmap <S-Right> l
    map <S-Left> v
    vmap <S-Left> h
endif
set guioptions-=T
set guioptions-=m
set guioptions-=R
set guioptions-=r
set guioptions-=L
set guioptions-=l
set noicon

set title
let g:ackprg="ack-grep -H --nocolor --nogroup --column"
set grepprg=ack
map <F3> :NERDTreeToggle<CR><CR>
" Toggle 80 column marker
nnoremap <F2> :call ToggleColorColumn()<CR>
func! ToggleColorColumn()
   if exists("b:colorcolumnon") && b:colorcolumnon
     let b:colorcolumnon = 0
       exec ':set colorcolumn=0'
     echo '80 column marker off'
   else
       let b:colorcolumnon = 1
       exec ':set colorcolumn=80'
        echo '80 column marker on'
    endif    
endfunc
set guifont=Inconsolata\ Medium\ 12

syntax enable
set background=dark
