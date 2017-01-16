autoload -Uz promptinit
autoload -U zmv
promptinit

if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    #test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias reload='source ~/.zshrc'

# Virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
source /usr/local/bin/virtualenvwrapper.sh

# 256 palette 
export TERM=xterm-256color
# eval `dircolors $HOME/.dir_colors/dircolors.256dark`

# Python UTF-8
export PYTHONIOENCONDING=utf-8

# History
umask 022
setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt NOTIFY
setopt NOHUP
setopt MAILWARN

HISTFILE=$HOME/.zsh_history
HISTSIZE=5000
SAVEHIST=5000
bindkey -v
bindkey "^R" history-incremental-search-backward

# noglob alias
alias ssh='noglob ssh'
alias scp='noglob scp'

# local bin
export PATH="$PATH:$HOME/bin"

# Base16 themes
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# compose-helper
export PATH="$HOME/.compose_helper/bin:$PATH"
