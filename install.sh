#!/bin/bash
BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Setup git
ln -s ${BASEDIR}/git/gitconfig ~/.gitconfig
ln -s ${BASEDIR}/git/gitignore ~/.gitignore
ln -s ${BASEDIR}/git/gitmessage ~/.gitmessage

# Install homebrew dependencies
bash ${BASEDIR}/homebrew/install.sh

# Install pip3 packages
pip3 install --user -r ${BASEDIR}/pip3/install.sh

# Set osx defaults
bash ${BASEDIR}/osx-defaults/set-defaults.sh

# Configuring ssh
mkdir -p ${HOME}/.ssh/
mkdir -p ${BASEDIR}/ssh/
ln -s ${BASEDIR}/ssh/config \
	~/.ssh/config

# vimfiles
mkdir -p ~/.config
ln -s ${BASEDIR}/nvim/ ~/.config/
nvim +PlugInstall +qall

# bash
ln -s ${BASEDIR}/bash/bash_profile ~/.bash_profile

# fonts
cp ${BASEDIR}/fonts/* ~/Library/Fonts/
