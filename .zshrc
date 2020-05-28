# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi
# Customize to your needs...

#alias -g B='`git branch -a | peco --prompt "GIT BRANCH>" | head -n 1 | sed -e "s/^\*\s*//g"`'
alias -g B='`git branch | peco | sed -e "s/^\*[ ]*//g"`'

function peco-select-history() {
    BUFFER=$(fc -l -r -n 1 | peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle redisplay
}
zle -N peco-select-history
bindkey '^r' peco-select-history

function directory-bookmark() {
    BUFFER=$(cat ~/.config/directory-bookmark.txt | peco )
    CURSOR=$#BUFFER
    zle accept-line
}
zle -N directory-bookmark
bindkey '^b' directory-bookmark

function git-root() {
  if git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    cd `git rev-parse --show-toplevel`
  fi
}

path=(
  $HOME/.nodebrew/current/bin(N-/)
  $HOME/.composer/vendor/bin(N-/)
  $HOME/.phpbrew/bin(N-/)
  $HOME/.rbenv/shims(N-/)
  $HOME/.goenv/shims(N-/)
  $HOME/workspace/go/bin(N-/)
  /usr/local/opt/mysql-client/bin(N-/)
  /usr/local/mysql/bin(N-/)
  /snap/bin(N-/)
  $path
)

[[ -s $HOME/.zshrc.local ]] && source $HOME/.zshrc.local
[[ -s $HOME/.phpbrew/bashrc ]] && source  $HOME/.phpbrew/bashrc
[[ -s $HOME/.rbenv/shims ]] && eval "$(rbenv init -)"
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"
which direnv > /dev/null 2>&1 && eval "$(direnv hook zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
