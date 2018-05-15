# Path to your oh-my-zsh installation.
  export ZSH=/home/bartosz/.oh-my-zsh

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

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
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

alias u="yaourt -Syyuu --noconfirm"
alias s="yaourt -Ss"
alias i="yaourt -S"
alias id="pacman -Qs"

alias z='f() {(zathura $1 &)};f'
alias zz='f() {(zathura $1 &) && exit};f'
#alias zn='f() {(zathura $1 &) && (vim $HOME"/Dropbox/reading_notes/"$(basename $1 .pdf)"__NOTES.md")};f'
alias zn='f() {(zathura $1".pdf" &) && (vim $1"__NOTES.md")};f'

_editor_fts=(cpp cxx cc c hh h inl asc txt TXT tex md py)
for ft in $_editor_fts ; do alias -s $ft=$EDITOR ; done

alias tt="vim ~/Dropbox/Lists/TODO.md"
alias ttc="vim ~/Dropbox/Lists/TODO-computer.md"
alias tts="vim ~/Dropbox/Lists/TODO-sidestudy.md"
alias ttp="vim ~/Dropbox/Lists/TODO-phd.md"
alias ddp="vim ~/Dropbox/Lists/DEADLINES-phd.md"
alias nnp="vim ~/Dropbox/notes-phd.md"
alias nn="vim ~/Dropbox/notes.md"
alias pp="vim ~/Dropbox/Lists/tabelaProgresu.md"
alias hh="vim ~/Dropbox/homepage.html"
alias ww="vim ~/Dropbox/Lists/parole.md"
alias wwe="vim ~/Dropbox/Lists/parole_en.md"
alias gge="vim ~/Dropbox/Lists/english_grammar_notes.md"
alias ll="vim ~/Dropbox/Lists/lektury.md"

alias z600="ssh -t bp319501@students.mimuw.edu.pl ssh bartosz@10.3.5.247"
alias grid01="ssh bartosz@grid01.ciirc.cvut.cz"
alias grid03="ssh piotrbar@grid.ciirc.cvut.cz"
alias grid05="ssh -t piotrbar@grid.ciirc.cvut.cz ssh 10.35.125.54"
alias duch="ssh bp319501@duch.mimuw.edu.pl"
alias students="ssh bp319501@students.mimuw.edu.pl"
alias icm="ssh bartosz@login.icm.edu.pl"
alias home="ssh serwer1766398@serwer1766398.home.pl"

alias sls="screen -ls"
alias sr="screen -r"
alias sS="screen -S"

alias vv="vim ~/.vimrc"
alias vz="vim ~/.zshrc"
alias vi3="vim ~/.config/i3/config"

alias py="python3"

alias duh="du -h -d 1 | sort -hr"
alias unlock='sudo rm /var/lib/pacman/db.lck'

alias fd='find . -type d -name'
alias ff='find . -type f -name'
# grep string in all non-binary files in current directory
alias gg='grep -rnwI . -e'

#so as not to be disturbed by Ctrl-S Ctrl-Q in terminals:
stty -ixon

export MIZFILES="/usr/local/share/mizar"