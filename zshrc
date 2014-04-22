# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"


alias jsuol='cd ~/root/svn/webcontent/com/jsuol/c/'
alias info='cd ~/root/svn/branches/infograficos/'
alias svg2json='python ~/Dropbox/lab/python/svg2json/svg2json.py'
alias subl="sublime"
alias svnu="sudo svn update"
alias svnci="sudo svn ci -m"
alias svna="sudo svn add"
alias svnl="sudo svn log"
alias svncu="sudo svn cleanup"
alias chmod777="sudo chmod 777 -R ./"
alias chmodx="sudo chmod +x"
alias svnup="cd ~ && ./update-svn.sh"
alias stats="cd ~/Dropbox/Jogue\ Free/Workflow/ && casperjs getStats.js"
alias tmux="tmux -c zsh"
alias gs="grunt server"
alias gd="grunt dist"
alias gdi="grunt dist:img"
alias gdj="grunt dist:js"
alias gdc="grunt dist:css"

export TERM=xterm-256color
[ -n "$TMUX" ] && export TERM=screen-256color

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp 
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/franklin/.rvm/bin"
# export MANPATH="/usr/local/man:$MANPATH"

# # Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='gvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"


alias gitlog="git log --all --graph --decorate --oneline --abbrev-commit"

precmd() { print "" }
