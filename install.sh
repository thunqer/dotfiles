#!/usr/bin/env bash

# --- give some reasonable idea of what's going on ---
echo -e "\033[0;31mWarning! This script will remove and/or replace the following paths:\033[0m"
echo -e "\t- ~/.emacs.d"
echo -e "\t- ~/.doom.d"
echo -e "\t- ~/.zshrc"
read -p "Are you sure (y/n)? " -n 1 -r && echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    exit 0
fi

# --- download packages ---

## install brew
if ! brew -v &> /dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

## mostly installing better shell functions
UPDATED_CORE=(coreutils findutils gnu-sed gnutls grep tmux git cmake)
MODERN_CORE=(exa du duf broot fd ripgrep tldr cheat gping httpie curlie dog bat)
OTHER_STUFF=(multimarkdown shellcheck)
brew install "${UPDATED_CORE[@]}"
brew install "${MODERN_CORE[@]}"
brew install "${OTHER_STUFF[@]}"

## emacs & doom
brew tap railwaycat/emacsmacport
brew install --cask emacs-mac
rm -rf ~/.emacs.d # remove default .emacs for doom
git clone --depth  1 https://github.com/hlissner/doom-emacs ~/.emacs.d

## other fonts look too wide now
brew tap homebrew/cask-fonts
brew install --cask font-iosevka

## python stuff - for lsp mode
pip3 install pyflakes
pip3 install python-lsp-server

## nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
nvm install --lts
npm i -g bash-language-server # for sh lsp

## oh my zsh - it's just ok
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

## osx syntax highlighting for plain english - intended for org-mode integration
curl -Ls https://github.com/stephencelis/syn/releases/download/v0.2.1/syn > syn && chmod 755 syn && mv syn /usr/local/bin

# --- link to config in dotfiles/ ---
rm ~/.zshrc
ln -s ~/dotfiles/.zshrc ~/.zshrc
rm ~/.tmux.conf
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
rm -rf ~/.doom.d
ln -s ~/dotfiles/.doom.d ~/.doom.d
