#!/usr/bin/env bash

# --- download packages ---

## install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

## mostly installing better shell functions
UPDATED_CORE=(coreutils findutils gnu-sed gnutls grep tmux git cmake)
MODERN_CORE=(exa du duf broot fd ripgrep tldr cheat gping httpie curlie dog)
OTHER_STUFF=(multimarkdown shellcheck)
brew install "${UPDATED_CORE[@]}"
brew install "${MODERN_CORE[@]}"
brew install "${OTHER_STUFF[@]}"

## emacs & doom
brew tap railwaycat/emacsmacport
brew install --cask emacs-mac
rm -rf ~/.emacs.d # remove default .emacs for doom
git clone --depth  1 https://github.com/hlissner/doom-emacs ~/.emacs.d
rm -rf ~/.doom.d # remove default doom config

## other fonts look too wide now
brew tap homebrew/cask-fonts
brew install --cask font-iosevka

## python stuff - for lsp mode
pip3 install pyflakes
pip3 install python-lsp-server

## nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

## oh my zsh - it's just ok
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
rm ~/.zshrc # oh my zsh makes one

# --- link to config in dotfiles/ ---
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.doom.d ~/.doom.d
