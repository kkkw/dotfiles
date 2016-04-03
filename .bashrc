if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -e ~/.nodebrew/current/bin ]; then
    export PATH=$HOME/.nodebrew/current/bin:$PATH
fi

if [ -e /usr/local/mysql/bin ]; then
    export PATH=/usr/local/mysql/bin:$PATH
fi

if [ -e /usr/local/bin/direnv ]; then
    eval "$(direnv hook bash)"
fi
# BEGIN ANSIBLE MANAGED BLOCK FOR PHPBREW
if [ -e ~/.phpbrew/bashrc ]; then
    source  ~/.phpbrew/bashrc
    export PATH=$PATH:~/.phpbrew/bin
fi
# END ANSIBLE MANAGED BLOCK FOR PHPBREW
# BEGIN ANSIBLE MANAGED BLOCK FOR COMPOSER
if [ -e ~/.composer/vendor/bin ]; then
    export PATH=$PATH:~/.composer/vendor/bin
fi
# END ANSIBLE MANAGED BLOCK FOR COMPOSER
