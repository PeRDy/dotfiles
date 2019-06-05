fpath+=~/.zfunc
autoload -U zmv

# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="spaceship"
plugins=(
  git
  dotenv
  docker
  docker-compose
  pip
  jsontools
  vi-mode
  fzf
  aws
  zsh-autosuggestions
  zsh-syntax-highlighting
)
source $ZSH/oh-my-zsh.sh

# Install config
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob nomatch notify
bindkey -e
# End of lines configured by zsh-newuser-install

export SPACESHIP_TIME_SHOW=true
export SPACESHIP_BATTERY_SHOW=always
export SPACESHIP_EXIT_CODE_SHOW=true

# Base16 Shell
#BASE16_SHELL="$HOME/.config/base16-shell/"
#[ -n "$PS1" ] && \
#    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
#        eval "$("$BASE16_SHELL/profile_helper.sh")"

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
alias ll='ls -lF'
alias la='ls -A'
alias l='ls -CF'
alias reload='source ~/.zshrc'

# Python UTF-8
export PYTHONIOENCONDING=utf-8

# local bin
export PATH="$PATH:$HOME/bin"

# added by travis gem
[ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh

# Set fzf installation directory path
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

