#!/bin/sh

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -f $HOME/.zshrc
ln -sv $HOME/.dotfiles/.zshrc $HOME/.zshrc

rm -f $HOME/.gitconfig
ln -sv $HOME/.dotfiles/.gitconfig $HOME/.gitconfig

# Add starship config
if [ ! -d $HOME/.config/ ]; then
    mkdir $HOME/.config/
fi
rm -f $HOME/.config/starship.toml
ln -sv $HOME/.dotfiles/starship.toml $HOME/.config/starship.toml

# Add starship config
if [ ! -d $HOME/.config/direnv ]; then
    mkdir $HOME/.config/direnv
fi
rm -f $HOME/.config/direnv/direnv.toml
ln -sv $HOME/.dotfiles/direnv.toml $HOME/.config/direnv/direnv.toml
