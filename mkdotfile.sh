#!/bin/bash

#link dotfiles from dropbox to ~

local=`pwd`

#if [ `uname -o`
#mklink linkfile target

#ln -sf $(pwd)/.zshrc ~/.zshrc
#ln -sf $(pwd)/.alias ~/.alias
#ln -sf $(pwd)/.vimrc ~/.vimrc
ln -sF $(pwd)/.vimrc.local ~/.vimrc.local
ln -sF $(pwd)/.vimrc.before.local ~/.vimrc.before.local
ln -sF $(pwd)/.vimrc.bundles.local ~/.vimrc.bundles.local
ln -sF $(pwd)/.vimperatorrc ~/.vimperatorrc
#ln -sFd $(pwd)/UltiSnips ~/.vim/UltiSnips

#ln -sf $(pwd)/.tmux.conf ~/.tmux.conf

#ln -sf $(pwd)/.bashrc ~/.bashrc

#ln -sf $(pwd)/.kermrc ~/.kermrc
