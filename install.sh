#!/usr/bin/env bash

# package management
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
BREW_PACKAGES=(coreutils findutils gnu-sed gnutls grep tmux git cmake multimarkdown ripgrep shellcheck)
brew install "${BREW_PACKAGES[@]}"
brew tap railwaycat/emacsmacport
brew install --cask emacs-mac
brew tap homebrew/cask-fonts
brew install --cask font-iosevka
pip3 install pyflakes
pip3 install python-lsp-server
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
nvm install --lts

# shell / tmux
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
rm ~/.zshrc
ln -s ~/dotfiles/.zshrc ~/.zshrc

# doom
rm -rf ~/.emacs.d
git clone --depth  1 https://github.com/hlissner/doom-emacs ~/.emacs.d
rm -rf ~/.doom.d
ln -s ~/dotfiles/.doom.d ~/.doom.d
