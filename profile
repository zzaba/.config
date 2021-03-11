#!/bin/sh

# Apps
export BROWSER=firefox
export EDITOR=micro
export PAGER=less

# XDG
export XDG_CONFIG_HOME=~/.config
export XDG_CACHE_HOME=~/.cache
export XDG_DATA_HOME=~/.local/share
export XDG_RUNTIME_DIR=/tmp

# Docker
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
export MACHINE_STORAGE_PATH="$XDG_DATA_HOME"/docker-machine

# .NET
export DOTNET_ROOT="$XDG_DATA_HOME/dotnet"

# GO
export GOBIN="$XDG_DATA_HOME/go/bin"
export GOPATH="$XDG_DATA_HOME/go"

# Xorg
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
export XSERVERRC="$XDG_CONFIG_HOME"/X11/xserverrc

# less
export LESSHISTFILE=-
export LESSKEY="$XDG_CONFIG_HOME"/less/lesskey

# readline
export INPUTRC="$XDG_CONFIG_HOME/readline/inputrc"

# PATH
export PATH=$PATH:$HOME/.local/bin:$DOTNET_ROOT:$GOBIN

[ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ] && startx "XDG_CONFIG_HOME"/X11/xinitrc
