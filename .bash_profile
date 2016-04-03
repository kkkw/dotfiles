if [ -f ~/.bashrc ] ; then
. ~/.bashrc
fi

export HOMEBREW_CASK_OPTS="--appdir=/Applications"
export EDITOR="vim"

if [ -f /usr/local/etc/bash_completion.d/git-prompt.sh ]; then
    . /usr/local/etc/bash_completion.d/git-prompt.sh
    GIT_PS1_SHOWDIRTYSTATE=true
    export PS1='\h\[\033[00m\]:\W\[\033[31m\]$(__git_ps1 [%s])\[\033[00m\]\$ '
fi

if [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
    . /usr/local/etc/bash_completion.d/git-completion.bash
fi

if [ -f /usr/local/etc/bash_completion ]; then
    . /usr/local/etc/bash_completion
fi

if [ -f /usr/local/etc/bash_completion.d/vagrant ]; then
    . /usr/local/etc/bash_completion.d/vagrant
fi

if [ -f /usr/local/bin/hub ]; then
  eval "$(hub alias -s)"
fi

if [ -f /usr/local/etc/bash_completion.d/hub.bash_completion.sh ]; then
    . /usr/local/etc/bash_completion.d/hub.bash_completion.sh
fi

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi
