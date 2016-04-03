case "${OSTYPE}" in
darwin*)
alias ls="ls -G"
alias ll="ls -laFG"
alias la="ls -AG"
;;
linux*)
alias ls='ls --color'
alias ll='ls -laF --color'
alias la='ls -A --color'
;;
esac
