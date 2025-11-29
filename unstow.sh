#!/bin/zsh

stow -D -v --target="$XDG_CONFIG_HOME" terminal theme tools
stow -D -v --target="$HOME" shell
