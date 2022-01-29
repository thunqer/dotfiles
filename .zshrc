# oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="passion"
zstyle ':omz:update' mode reminder  # just remind me to update when it's time
COMPLETION_WAITING_DOTS="true"
plugins=(git colored-man-pages)
source $ZSH/oh-my-zsh.sh

# user config

## brew things
export PATH=/opt/homebrew/bin:$PATH # homebrew - this line needs to be updated depending on your mac /usr/local or /opt/homebrew
export PATH=/opt/homebrew/opt/llvm/bin:$PATH
export PATH=$PATH:~/.emacs.d/bin/ # doom commands
export PATH=$PATH:~/.ghcup/bin # ghc - haskell
export PATH=$PATH:~/.cabal/bin
export PATH=$PATH:~/dotfiles/bin
for d in "$(brew --prefix)"/opt/*/libexec/gnubin; do export PATH=$d:$PATH; done
for d in "$(brew --prefix)"/opt/*/libexec/gnuman; do export MANPATH=$d:$MANPATH; done

## nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

## python
export PATH=$PATH:$HOME/Library/Python/3.9/bin
export PIPENV_VENV_IN_PROJECT=1

## updating core utils & related
alias ls="exa -laT --icons --group-directories-first --level=1 --inode --git --ignore-glob=\"Downloads|Documents|Desktop|Library|Movies|Music|Pictures|Public\""
alias lss="exa -lT --icons --group-directories-first --level=1 --inode --git --ignore-glob=\"Downloads|Documents|Desktop|Library|Movies|Music|Pictures|Public\""
alias du="dust"
alias df="duf"
alias find="fd"
alias grep="rg"
alias s="broot"
alias man2="tldr"
alias man3="cheat"
alias ping="gping"
alias dig="dog"

## aliases
alias src="source ~/.zshrc"
alias tm="tmux attach -t main"
alias venv="source venv/bin/activate"
