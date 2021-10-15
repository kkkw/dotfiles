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
if [[ -s "/opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]]; then
  source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

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
  /opt/homebrew/bin(N-/)
  $HOME/Library/Python/3.9/bin(N-/)
  $HOME/.nodebrew/current/bin(N-/)
  $HOME/.composer/vendor/bin(N-/)
  $HOME/.phpbrew/bin(N-/)
  $HOME/.rbenv/shims(N-/)
  $HOME/.goenv/shims(N-/)
  $HOME/workspace/go/bin(N-/)
  $HOME/go/bin(N-/)
  /usr/local/opt/mysql-client/bin(N-/)
  /usr/local/mysql/bin(N-/)
  /snap/bin(N-/)
  $HOME/.npm-global/bin(N-/)
  $path
)

[[ -s $HOME/.zshrc.local ]] && source $HOME/.zshrc.local
[[ -s $HOME/.phpbrew/bashrc ]] && source  $HOME/.phpbrew/bashrc
[[ -s $HOME/.rbenv/shims ]] && eval "$(rbenv init -)"
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"
which direnv > /dev/null 2>&1 && eval "$(direnv hook zsh)"
which jump> /dev/null 2>&1 && eval "$(jump shell)"
which gh> /dev/null 2>&1 && eval "$(gh completion -s zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NNN_PLUG='o:fzopen;m:nmount;x:_chmod +x $nnn;j:jump'
export NNN_BMS='4:/media/yuya/volume4000;c:/media/yuya/volume4000/comic;2:/media/yuya/volume2000-1;b:~/workspace/beast;a:~/workspace/aladdin;h:~/workspace/hibiki-bot'
export NNN_FIFO=/tmp/nnn.fifo
n()
{
    export NNN_TMPFILE=${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd

    nnn "$@"

    if [ -f $NNN_TMPFILE ]; then
            . $NNN_TMPFILE
            rm -f $NNN_TMPFILE > /dev/null
    fi
}

[[ -s /opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc ]] && source /opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc
[[ -s /opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc ]] && source  /opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc
