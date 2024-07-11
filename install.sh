#!/bin/sh

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -rf $HOME/.zshrc
ln -sw $HOME/.dotfiles/.zshrc $HOME/.zshrc

rm -rf $HOME/.gitconfig
ln -sw $HOME/.dotfiles/.gitconfig $HOME/.gitconfig

# Add starship config
if [ ! -d $HOME/.config/ ]; then
    mkdir $HOME/.config/
fi
ln -sw $HOME/.dotfiles/starship.toml $HOME/.config/starship.toml

# Add starship config
if [ ! -d $HOME/.config/direnv ]; then
    mkdir $HOME/.config/direnv
fi
ln -sw $HOME/.dotfiles/direnv.toml $HOME/.config/direnv/direnv.toml
