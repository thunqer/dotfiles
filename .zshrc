# oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="macovsky"
zstyle ':omz:update' mode reminder  # just remind me to update when it's time
COMPLETION_WAITING_DOTS="true"
plugins=(git colored-man-pages)
source $ZSH/oh-my-zsh.sh

# user config

## brew things
export PATH=/opt/homebrew/bin:$PATH # homebrew - this line needs to be updated depending on your mac /usr/local or /opt/homebrew
export PATH=$PATH:~/.emacs.d/bin/ # doom commands
for d in "$(brew --prefix)"/opt/*/libexec/gnubin; do export PATH=$d:$PATH; done
for d in "$(brew --prefix)"/opt/*/libexec/gnuman; do export MANPATH=$d:$MANPATH; done
## nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
## python
PATH="$PATH:/Users/sayeef/Library/Python/3.8/bin"

alias ls="ls -l --color"
alias lsa="ls -Al --color"
alias src="source ~/.zshrc"
