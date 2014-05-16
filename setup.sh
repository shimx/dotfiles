#! /bin/bash

# zsh
touch $HOME/dotfiles/.zsh/zshenv.local
touch $HOME/dotfiles/.zsh/zshrc.local

# vim
mkdir $HOME/dotfiles/.vim
git submodule add git://github.com/Shougo/neobundle.vim $HOME/dotfiles/.vim/bundle/neobundle.vim
git submodule add git://github.com/honza/vim-snippets.git $HOME/dotfiles/.vim/bundle/vim-snippets

# make symlink
for file in `find $HOME/dotfiles -maxdepth 1 -name '.*' | grep -v 'dotfiles/.git' | perl -nle 'm!dotfiles/(.+)$! and print $1'`; do
    ln -s $HOME/dotfiles/$file $HOME/$file
done

