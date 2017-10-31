# Path to your oh-my-zsh installation.
  export ZSH=/home/bartosz/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

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
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git sudo python web-search
common-aliases)

# User configuration

# export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

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

alias B="rsync -av \
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
alias BD="rsync -av --delete \
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

alias BWD="rsync -av \
--exclude '.*' \
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

alias u="yaourt -Syyuu --noconfirm"
alias s="yaourt -Ss"
alias i="yaourt -S"
alias id="pacman -Qs"

alias v="vim"
alias zz='f() {(zathura $1 &) && exit};f'
alias z='f() {(zathura $1 &)};f'

alias -s pdf=zathura
alias -s ps=zathura
alias -s djvu=zathura

_editor_fts=(cpp cxx cc c hh h inl asc txt TXT tex md py)
for ft in $_editor_fts ; do alias -s $ft=$EDITOR ; done

alias tt="vim ~/Dropbox/Lists/TODO.md"
alias ttc="vim ~/Dropbox/Lists/TODO-computer.md"
alias tts="vim ~/Dropbox/Lists/TODO-study.md"
alias pp="vim ~/Dropbox/Lists/tabelaProgresu.md"
alias hh="vim ~/Dropbox/homepage.html"
alias nn="vim ~/Dropbox/notes.md"
alias cc="vim ~/Dropbox/Lists/lektury.md"
alias ww="vim ~/Dropbox/Lists/parole.md"
alias wwe="vim ~/Dropbox/Lists/parole_en.md"

alias z600="ssh -t bp319501@students.mimuw.edu.pl ssh bartosz@10.3.5.247"
alias grid01="ssh bartosz@grid01.ciirc.cvut.cz"
alias grid="ssh piotrbar@grid.ciirc.cvut.cz"
alias duch="ssh bp319501@duch.mimuw.edu.pl"
alias students="ssh bp319501@students.mimuw.edu.pl"
alias icm="ssh bartosz@login.icm.edu.pl"

alias sls="screen -ls"
alias sr="screen -r"
alias sS="screen -S"

alias vv="vim ~/.vimrc"
alias vz="vim ~/.zshrc"
alias vi3="vim ~/.config/i3/config"

alias py="python3"

alias duh="du -h -d 1 | sort -hr"
alias unlock='sudo rm /var/lib/pacman/db.lck'
alias conf='/usr/bin/git --git-dir=/home/bartosz/.dotfiles --work-tree=/home/bartosz'

#so as not to be disturbed by Ctrl-S Ctrl-Q in terminals:
stty -ixon

export MIZFILES="/usr/local/share/mizar"

#eval `opam config env`


# temporary aliases
alias PhD="cd ~/PhD"
alias prs="cd ~/PhD/premise-selection-deepmath-style"
