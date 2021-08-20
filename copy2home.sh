#!/bin/bash

# install needed package
pacman -S python python-devel python-pip tmux git man mingw-w64-x86_64-universal-ctags-git
pip install powerline-shell virtualenvwrapper
# install MSYS gcc
pacman -S gcc pkgconf make
# install MINGW gcc
pacman -S mingw-w64-x86_64-make mingw-w64-x86_64-pkgconf mingw-w64-x86_64-gcc

read -p "Install tmux? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
	pushd ~
	git clone https://github.com/gpakosz/.tmux.git
	ln -s -f .tmux/.tmux.conf
	cp .tmux/.tmux.conf.local .
	popd
fi

# copy my config
echo "Copy my config to home..."
cp -a configs/. ~/

# install vim stuff
read -p "Install vim plugin? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	vim -c 'PluginInstall' -c 'qa!'
fi
