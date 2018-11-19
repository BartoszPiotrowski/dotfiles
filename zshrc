# Path to your oh-my-zsh installation.
export ZSH=/home/bartosz/.oh-my-zsh

export EPROVER=/home/bartosz/PhD/E/PROVER/eprover
alias eprover="/home/bartosz/PhD/E/PROVER/eprover"

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
#

alias bb="rsync -av \
--exclude 'tmp*' \
--exclude 'Videos' \
--exclude 'Music' \
--exclude 'Pictures' \
--exclude 'Downloads' \
--exclude 'R' \
--exclude 'E' \
--exclude '.cache' \
--exclude '*Trash*' \
~/ /run/media/bartosz/BACKUPSTICK/"

# rsync will delete files not present in ~/
alias bbd="rsync -av --delete \
--exclude 'tmp*' \
--exclude 'Videos' \
--exclude 'Music' \
--exclude 'Pictures' \
--exclude 'Downloads' \
--exclude 'R' \
--exclude 'E' \
--exclude '.cache' \
--exclude '*Trash*' \
~/ /run/media/bartosz/BACKUPSTICK/"

alias bbs="rsync -av \
--exclude '.*' \
--exclude 'tmp*' \
--exclude 'Archivalias' \
--exclude 'Videos' \
--exclude 'Music' \
--exclude 'Pictures' \
--exclude 'Downloads' \
--exclude 'R' \
--exclude 'E' \
--exclude '.cache' \
--exclude '*Trash*' \
~/ /run/media/bartosz/BACKUPSTICK/"

alias bbp="rsync -av \
--exclude '.*' \
--exclude 'tmp*' \
--exclude '.cache' \
--exclude '*Trash*' \
~/PhD/ /run/media/bartosz/BACKUPSTICK/PhD/"

alias u="sudo pacman -Syyuu --noconfirm"
alias s="sudo pacman -Ss"
alias i="sudo pacman -S"
alias id="pacman -Qs"

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
alias nn="vim ~/Notes/NOTES.md; clear"
alias ttc="vim ~/Notes/TODO-computer.md; clear"
alias ss="vim ~/Notes/TODO-sidestudy.md; clear"
alias tts="vim ~/Notes/TODO-sidestudy.md; clear"
alias ww="vim ~/Notes/parole.md; clear"
alias wwe="vim ~/Notes/parole_en.md; clear"
alias wwl="vim ~/Notes/parole_lt.md; clear"
alias wwc="vim ~/Notes/parole_cz.md; clear"
alias gge="vim ~/Notes/english_grammar_notes.md; clear"
alias ttp="vim ~/PhD/NOTES/TODO.md; clear"
alias nnp="vim ~/PhD/NOTES/NOTES.md; clear"
alias pps="vim ~/PhD/NOTES/PAPERS-summaries.md; clear"
alias ppq="vim ~/PhD/NOTES/PAPERS-queue.md; clear"
alias hh="vim ~/Documents/homepage.html; clear"

alias v="vim"
alias vi="vim"

alias z600="ssh -t bp319501@students.mimuw.edu.pl ssh bartosz@10.3.5.247"
alias grid01="ssh bartosz@grid01.ciirc.cvut.cz"
alias grid03="ssh piotrbar@grid.ciirc.cvut.cz"
alias grid04="ssh -t piotrbar@grid.ciirc.cvut.cz ssh 10.35.125.53"
alias grid05="ssh -t piotrbar@grid.ciirc.cvut.cz ssh 10.35.125.54"
alias grid06="ssh -t piotrbar@grid.ciirc.cvut.cz ssh 10.35.125.50"
alias grid07="ssh -t piotrbar@grid.ciirc.cvut.cz ssh 10.35.125.55"
alias grid08="ssh -t piotrbar@grid.ciirc.cvut.cz ssh 10.35.125.56"
alias grid09="ssh -t piotrbar@grid.ciirc.cvut.cz ssh 10.35.125.57"
alias grid10="ssh -t piotrbar@grid.ciirc.cvut.cz ssh 10.35.125.58"
alias grid11="ssh -t piotrbar@grid.ciirc.cvut.cz ssh 10.35.125.59"
alias grid12="ssh -t piotrbar@grid.ciirc.cvut.cz ssh 10.35.125.60"
alias grid13="ssh -t piotrbar@grid.ciirc.cvut.cz ssh 10.35.125.61"
alias grid14="ssh -t piotrbar@grid.ciirc.cvut.cz ssh 10.35.125.62"
alias air01="ssh -t bartosz@grid01.ciirc.cvut.cz ssh 10.35.125.68"
alias duch="ssh bp319501@duch.mimuw.edu.pl"
alias students="ssh bp319501@students.mimuw.edu.pl"
alias icm="ssh bartosz@login.icm.edu.pl"
alias home="ssh serwer1766398@serwer1766398.home.pl"

alias sls="screen -ls"
alias sr="screen -r"
alias sS="screen -S"

alias py="python3"
alias py3="python3"
alias py2="python2"

alias sa="source activate"
alias sd="source deactivate"

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


mcd () {
    mkdir -p $1
    cd $1
}

#so as not to be disturbed by Ctrl-S Ctrl-Q in terminals:
stty -ixon

# Mizar
export MIZFILES="/usr/local/share/mizar"

# Anaconda
export PATH=/home/bartosz/opt/anaconda3/bin:$PATH
