#! /bin/bash

DOTFILES_DIR=$HOME/dotfiles

# make symlink
ln -sfv $DOTFILES_DIR/config/tmux/tmux.conf $HOME/.tmux.conf
ln -sfv $DOTFILES_DIR/config/zsh/zshenv $HOME/.zshenv
ln -sfv $DOTFILES_DIR/config/zsh/zshrc $HOME/.zshrc
ln -sfv $DOTFILES_DIR/config/vim/vimrc $HOME/.vimrc

