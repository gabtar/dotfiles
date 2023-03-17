#!/bin/sh
# Installs all configs

stow --target=$HOME alacritty
stow --target=$HOME neovim
stow --target=$HOME qtile
stow --target=$HOME picom
stow --target=$HOME rofi
stow --target=$HOME tmux
stow --target=$HOME zsh
