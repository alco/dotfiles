# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
export ZSH_THEME="tjkirch"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
export DISABLE_AUTO_TITLE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx github pip)

source $ZSH/oh-my-zsh.sh
unsetopt correct_all

# Customize to your needs...
export PATH=/usr/local/share/python:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin
export PYTHONPATH=/usr/local/lib/python
export NODE_PATH=/usr/local/lib/node_modules

alias ls='ls -G'
alias lsg='ls -Gg'

export GIT_EDITOR=vi
export SVN_EDITOR=$GIT_EDITOR

alias home="cd ~/home"

alias gco='git checkout'
alias gci='git commit'
alias grb='git rebase'
alias gad='git add'
alias gst='git status'

if [ -e /Developer/Platforms/iPhoneOS.platform/Developer/usr/bin ]; then
    export PATH=/Developer/Platforms/iPhoneOS.platform/Developer/usr/bin:$PATH
fi

if [ -e ~/home/bin ]; then
    export PATH=~/home/bin:$PATH
fi
