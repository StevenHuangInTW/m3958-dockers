#!/bin/bash

al=~/.vim/autoload
bl=~/.vim/bundle
vimrc=~/.vimrc
github=https://github.com

if [ ! -e "$al" ]; then
  mkdir -p $al
fi

if [ ! -e "$bl" ]; then
  mkdir -p $bl
fi
echo "${al}/pathogen.vim"

curl -LSso "${al}/pathogen.vim" https://raw.githubusercontent.com/tpope/vim-pathogen/v2.3/autoload/pathogen.vim

cat 1>$vimrc <<PATHOGENINIT
execute pathogen#infect()
syntax on
filetype plugin indent on
set ts=2
set expandtab
set nu
set shiftwidth=2
PATHOGENINIT

pushd $bl >/dev/null

git clone ${github}/tpope/vim-surround.git
git clone ${github}/Raimondi/delimitMate.git
#git clone ${github}/itchyny/lightline.vim

popd

#vim <<HELPTAGSINIT
#:Helptags
#:q
#HELPTAGSINIT
