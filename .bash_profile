# ~/.profile: executed by the command interpreter for login shells.

# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# Ruby
PATH="/usr/local/lib/ruby/gems/3.0.0/bin:/usr/local/opt/ruby/bin:$PATH"

# set PATH for gnu tools
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"
PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"
PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"

# set PATH for gpg2
PATH="/usr/local/MacGPG2/bin:$PATH"

# Golang

export GOPATH="/usr/local/Go"
export GO111MODULE=on
export GOPRIVATE=github.com/heetch
PATH="/usr/local/Go/bin:$PATH"

 #Clang path
#PATH="/usr/local/opt/llvm/bin":$PATH

# Iced (Clojure repl) path
PATH=/Users/juan/.local/share/nvim/plugged/vim-iced/bin:$PATH

# my bin path
PATH="$HOME/bin:$PATH"

export TERM="screen-256color"

# Clean PATH
export PATH=$(perl -e 'use List::MoreUtils qw(uniq); print join(":", uniq(split(/:/, %ENV{'PATH'})))')

# UTF-8 lang
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Less hightlight search
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;016m\E[48;5;220m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

# Source functions file
# source $HOME/.functions.bash

export EDITOR=$(which nvim)

# GPG config
export GPG_TTY=$(tty)
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)

# ASDF config
if [[ ! -z ${ENABLED_ASDF} ]]; then
	. $(brew --prefix asdf)/asdf.sh
	. $(brew --prefix asdf)/etc/bash_completion.d/asdf.bash
fi

# Useful functions
if [[ -f $HOME/.functions.bash ]]; then
	. $HOME/.functions.bash
fi

# Useful alias
if [[ -f $HOME/.alias.bash ]]; then
	. $HOME/.alias.bash
fi
