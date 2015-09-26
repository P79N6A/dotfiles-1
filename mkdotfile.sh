#!/bin/bash
#link dotfiles from pwd to ~

local=`pwd`

#if [ `uname -o`
#mklink linkfile target

#ln -sf $(pwd)/.zshrc ~/.zshrc
#ln -sf $(pwd)/.vimrc ~/.vimrc
#ln -sf $(pwd)/.aliase<Plug>(neocomplete_fallbac
ln -sf $(pwd)/.vimrc.local ~/.vimrc.local
ln -sf $(pwd)/.vimrc.before.local ~/.vimrc.before.local
ln -sf $(pwd)/.vimrc.bundles.local ~/.vimrc.bundles.local
ln -sf $(pwd)/.tmux.conf ~/.tmux.conf
ln -sf $(pwd)/.aliases ~/.aliases
#ln -sF $(pwd)/.vimperatorrc ~/.vimperatorrc
#ln -sFd $(pwd)/UltiSnips ~/.vim/UltiSnips
#ln -sf $(pwd)/.bashrc ~/.bashrc
#ln -sf $(pwd)/.kermrc ~/.kermrc
