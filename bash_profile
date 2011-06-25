alias ls='ls -G'
alias lsg='ls -Gg'

export GIT_EDITOR=vi
export SVN_EDITOR=$GIT_EDITOR

export NEW_HOME=~/home
export GITHUB=~/Dropbox/git

alias home="cd $NEW_HOME"

# Set up git autocompletion
#GIT_PS1_SHOWDIRTYSTATE=True
source "$NEW_HOME/goodies/git-completion.bash"
PS1='\W$(__git_ps1 " (%s)") \$ '

alias gco='git co'
alias gci='git ci'
alias grb='git rb'
alias gad='git add'
alias gst='git st'

# A handy recursive delete
alias rmall='find . -name $TO_REMOVE -print0 | xargs -0 rm -rf'

# Fetch quotes from forismatic.com
#echo
#./fetch-quote.sh
#echo

PATH=/usr/local/share/python:/usr/local/bin:/usr/local/sbin:$PATH

if [ -e "$NEW_HOME/bin" ]; then
    PATH="$NEW_HOME/bin:$PATH"
fi

# Set up Python path
#pypath="/Library/Frameworks/Python.framework/Versions/2.7/bin"
#if [ -e "$pypath" ]; then
#    PATH="$pypath:$PATH"
#fi

export PATH
