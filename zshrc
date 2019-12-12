# Path to your oh-my-zsh installation.
export ZSH=/home/bartosz/.oh-my-zsh

export EPROVER=/home/bartosz/opt/E/PROVER/eprover
alias eprover="/home/bartosz/opt/E/PROVER/eprover"

# Vim key bindings
bindkey -v
export KEYTIMEOUT=1

ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
 HIST_STAMPS="dd.mm.yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git sudo python web-search common-aliases autojump)

# User configuration

# export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

precmd() { eval "$PROMPT_COMMAND" }
PROMPT_COMMAND='pwd > "${HOME}/.cwd"'

# because git add completion was slow
__git_files () {
    _wanted files expl 'local files' _files
}
# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
export EDITOR='vim'
alias v="vim"
alias vi="vim"

alias rr="ranger"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


MOUNT_POINT=/run/media/bartosz/
DISK_LABEL=DATADRIVE1
BACKUP_DIR=$MOUNT_POINT/$DISK_LABEL/BACKUPS
backup () {
	DISK_PATH=`lsblk -i -o PATH,LABEL | grep $DISK_LABEL | cut -d' ' -f1`
	sudo mkdir -p $MOUNT_POINT/$DISK_LABEL
	sudo mount $DISK_PATH $MOUNT_POINT/$DISK_LABEL
	DIR_TO_BACKUP=`realpath $1`
	DIR_TO_BACKUP_NAME=`echo $DIR_TO_BACKUP | rev | cut -d'/' -f1 | rev`
	DATE=`date +%F--%H-%M-%S`
	DIR_TO_BACKUP_NEW=$BACKUP_DIR/$DIR_TO_BACKUP_NAME--$DATE
	DIR_TO_BACKUP_NEW_PARTIAL=$DIR_TO_BACKUP_NEW--PARTIAL
	mkdir $DIR_TO_BACKUP_NEW_PARTIAL
	if rsync -av $DIR_TO_BACKUP/ $DIR_TO_BACKUP_NEW_PARTIAL
	then
		mv $DIR_TO_BACKUP_NEW_PARTIAL $DIR_TO_BACKUP_NEW
		DIR_TO_BACKUP_SIZE=`du -hd0 $DIR_TO_BACKUP | cut -f1`
		DIR_TO_BACKUP_NEW_SIZE=`du -hd0 $DIR_TO_BACKUP_NEW | cut -f1`
		echo
		echo Directory:
		echo "$DIR_TO_BACKUP ($DIR_TO_BACKUP_SIZE)"
		echo fully backuped to:
		echo "$DIR_TO_BACKUP_NEW ($DIR_TO_BACKUP_NEW_SIZE)"
	else
		DIR_TO_BACKUP_SIZE=`du -hd0 $DIR_TO_BACKUP | cut -f1`
		DIR_TO_BACKUP_NEW_PARTIAL_SIZE=`du -hd0 $DIR_TO_BACKUP_NEW_PARTIAL \
													| cut -f1`
		echo
		echo Directory:
		echo "$DIR_TO_BACKUP ($DIR_TO_BACKUP_SIZE)"
		echo PARTIALLY backuped to:
		echo "$DIR_TO_BACKUP_NEW_PARTIAL ($DIR_TO_BACKUP_NEW_PARTIAL_SIZE)"
	fi
}

alias bb="backup"
alias bbh="backup ~"
alias bbp="backup ~/PhD"
alias bbn="backup ~/Notes; backup ~/PhD/NOTES"

alias bbl="l $BACKUP_DIR"

#alias bb="
#cd /run/media/bartosz/DATADRIVE1/BACKUPS;
#mkdir HOME-PARTIAL;
#rsync -av ~/ HOME-PARTIAL;
#mv HOME-PARTIAL HOME-`date +%F`
#"
#
## rsync will delete files not present in ~/
#alias bbd="rsync -av --delete \
#--exclude 'tmp*' \
#--exclude 'Videos' \
#--exclude 'Music' \
#--exclude 'Pictures' \
#--exclude 'Downloads' \
#--exclude 'R' \
#--exclude 'E' \
#--exclude '.cache' \
#--exclude '*Trash*' \
#~/ /run/media/bartosz/BACKUPSTICK/"
#
#alias bbs="rsync -av \
#--exclude '.*' \
#--exclude 'tmp*' \
#--exclude 'Archivalias' \
#--exclude 'Videos' \
#--exclude 'Music' \
#--exclude 'Pictures' \
#--exclude 'Downloads' \
#--exclude 'R' \
#--exclude 'E' \
#--exclude '.cache' \
#--exclude '*Trash*' \
#~/ /run/media/bartosz/BACKUPSTICK/"
#
#alias bbp="rsync -av \
#--exclude '.*' \
#--exclude 'tmp*' \
#--exclude '.cache' \
#--exclude '*Trash*' \
#~/PhD/ /run/media/bartosz/BACKUPSTICK/PhD/"

alias gtop="watch -n 0.5 nvidia-smi"

alias u="sudo pacman -Syyuu --noconfirm"
alias s="sudo pacman -Ss"
alias i="sudo pacman -S"
alias id="pacman -Qs"

alias pi="sudo pip install"

alias uy="yaourt -Syyuu --noconfirm"
alias sy="yaourt -Ss"
alias iy="yaourt -S"

alias lswifi="nmcli dev wifi list"
alias wifils="lswifi"
alias wifi="nmcli dev wifi con"
alias wificon="wifi"

pep () {
	autopep8 -aaaaaaaaaaaaaaaaaa $1 --in-place
}

#alias vim='f() {vim $1 && clear};f'
alias z='f() {(zathura $1 &)};f'
alias zz='f() {(zathura $1 &) && exit};f'
#alias zn='f() {(zathura $1 &) && (vim $HOME"/Dropbox/reading_notes/"$(basename $1 .pdf)"__NOTES.md")};f'
alias zn='f() {(zathura $1".pdf" &) && (vim $1"__NOTES.md")};f'

alias vn=viewnior

_editor_fts=(cpp cxx cc c hh h inl asc txt TXT tex md py)
for ft in $_editor_fts ; do alias -s $ft=$EDITOR ; done

alias tt="vim ~/Notes/TODO.md; clear"
alias db="vim ~/Notes/daily-basis.md; clear"
alias nn="vim ~/Notes/NOTES.notes; clear"
alias ttc="vim ~/Notes/TODO-computer.md; clear"
alias ss="vim ~/Notes/TODO-sidestudy.md; clear"
alias tts="vim ~/Notes/TODO-sidestudy.md; clear"
alias ww="vim ~/Notes/parole.md; clear"
alias wwe="vim ~/Notes/parole-en.md; clear"
alias wwl="vim ~/Notes/parole-lt.md; clear"
alias wwc="vim ~/Notes/parole-cz.md; clear"
alias gge="vim ~/Notes/english-grammar-notes.md; clear"
alias ttp="vim ~/PhD/NOTES/TODO.md; clear"
alias dep="vim ~/PhD/NOTES/DAILY-EXECUTION.md; clear"
alias nnp="vim ~/PhD/NOTES/NOTES.md; clear"
alias pps="vim ~/PhD/NOTES/PAPERS-summaries.md; clear"
alias ppq="vim ~/PhD/NOTES/PAPERS-queue.md; clear"
alias hh="vim ~/Documents/homepage.html; clear"

alias lt="ls -ltFhr"

alias z600="ssh -t bp319501@students.mimuw.edu.pl ssh bartosz@10.3.5.247"
alias air01="ssh -t bartosz@grid01.ciirc.cvut.cz ssh 10.35.125.68"
alias air02="ssh -t bartosz@grid01.ciirc.cvut.cz ssh 10.35.125.69"
alias air03="ssh -t bartosz@grid01.ciirc.cvut.cz ssh 10.35.125.70"
alias air04="ssh -t bartosz@grid01.ciirc.cvut.cz ssh 10.35.125.71"
alias air05="ssh -t bartosz@grid01.ciirc.cvut.cz ssh 10.35.125.72"
alias duch="ssh bp319501@duch.mimuw.edu.pl"
alias students="ssh bp319501@students.mimuw.edu.pl"
alias icm="ssh bartosz@login.icm.edu.pl"
alias home="ssh serwer1766398@serwer1766398.home.pl"
alias ciirc00="ssh piotrbar@cluster.ciirc.cvut.cz"
alias ciirc01="ssh -t piotrbar@cluster.ciirc.cvut.cz ssh node-01"
alias ciirc02="ssh -t piotrbar@cluster.ciirc.cvut.cz ssh node-02"
alias ciirc14="ssh -t piotrbar@cluster.ciirc.cvut.cz ssh node-14"
alias ciirc15="ssh -t piotrbar@cluster.ciirc.cvut.cz ssh node-15"
alias ciirc16="ssh -t piotrbar@cluster.ciirc.cvut.cz ssh node-16"
alias ciirc17="ssh -t piotrbar@cluster.ciirc.cvut.cz ssh node-17"
alias ciirc18="ssh -t piotrbar@cluster.ciirc.cvut.cz ssh node-18"

alias grid00="ssh piotrbar@grid.ciirc.cvut.cz"
alias grid01="ssh bartosz@grid01.ciirc.cvut.cz"
#alias grid04="ssh -t piotrbar@grid.ciirc.cvut.cz ssh 10.35.125.53"
alias grid05="ssh -t piotrbar@grid.ciirc.cvut.cz ssh 10.35.125.54"
#alias grid06="ssh -t piotrbar@grid.ciirc.cvut.cz ssh 10.35.125.50"
#alias grid07="ssh -t piotrbar@grid.ciirc.cvut.cz ssh 10.35.125.55"
#alias grid08="ssh -t piotrbar@grid.ciirc.cvut.cz ssh 10.35.125.56"
#alias grid09="ssh -t piotrbar@grid.ciirc.cvut.cz ssh 10.35.125.57"
#alias grid10="ssh -t piotrbar@grid.ciirc.cvut.cz ssh 10.35.125.58"
#alias grid11="ssh -t piotrbar@grid.ciirc.cvut.cz ssh 10.35.125.59"
#alias grid12="ssh -t piotrbar@grid.ciirc.cvut.cz ssh 10.35.125.60"
#alias grid13="ssh -t piotrbar@grid.ciirc.cvut.cz ssh 10.35.125.61"
#alias grid14="ssh -t piotrbar@grid.ciirc.cvut.cz ssh 10.35.125.62"

alias sls="screen -ls"
alias sr="screen -r"
alias sS="screen -S"

alias py="python3"
alias py3="python3"
alias py2="python2"
alias pya3="anaconda3"
alias pya="anaconda3"

alias saa="source activate"
alias sda="source deactivate"

alias sa='f() {source ~/envs/$1/bin/activate};f'

alias duh="du -h -d 1 | sort -hr"
alias unlock='sudo rm /var/lib/pacman/db.lck'

alias fd='f() {find . -type d -iname "*"$1"*"};f'
alias ff='f() {find . -type f -iname "*"$1"*"};f'
alias fff='find . -type f -iname'
alias ffd='find . -type d -iname'

alias zff='f(){zathura $(ff $1)};f'
alias zfff='f(){zathura $(fff $1)};f'
alias zzff='f(){(zathura $(ff $1) &) && exit};f'
alias zzfff='f(){(zathura $(fff $1) &) && exit};f'

# grep lines containing regexp pattern in all non-binary files in current
# directory (and its subdirectories, recursively)
alias gg='grep -rnI . -e'
alias ggi='grep -rnIi . -e' # ignore case (-i)
alias gpar='f(){echo; awk "/$1/" RS="\n\n" ORS="\n\n" $2};f'
alias pdfgrep='pdfgrep -n'

alias dedup='awk "!visited[$0]++"'

alias wgetdir='wget -r -np -nH -R "index.html*"'

mcd () {
    mkdir -p $1
    cd $1
}

#so as not to be disturbed by Ctrl-S Ctrl-Q in terminals:
stty -ixon

# Mizar
export MIZFILES="/usr/local/share/mizar"

# Anaconda
#export PATH=/home/bartosz/opt/anaconda3/bin:$PATH

# R
export R_LIBS="~/opt/R/"

TIMEFMT='%J   %U  user %S system %P cpu %*E total'$'\n'\
'avg shared (code):         %X KB'$'\n'\
'avg unshared (data/stack): %D KB'$'\n'\
'total (sum):               %K KB'$'\n'\
'max memory:                %M MB'$'\n'\
'page faults from disk:     %F'$'\n'\
'other page faults:         %R'

# # ex - archive extractor
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

