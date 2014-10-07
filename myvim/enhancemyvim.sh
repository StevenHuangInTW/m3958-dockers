#!/bin/bash

mkdir -p ~/.vim/autoload 
mkdir ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

echo "execute pathogen#infect()" >> ~/.vimrc
echo "syntax on" >> ~/.vimrc
echo "filetype plugin indent on" >> ~/.vimrc
pushd ~/.vim/bundle >/dev/null
git clone git://github.com/tpope/vim-surround.git
git clone git://github.com/Raimondi/delimitMate.git
popd

vim <<-HELPTAGS
  :Helptags
  :q
HELPTAGS
