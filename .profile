# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
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

# set path to include ~/.local/bin
PATH="$HOME/.local/bin:$PATH"

# set PATH so it includes user's private bin if it exists
#if [ -d "$HOME/bin" ] ; then
#    PATH="$HOME/bin:$PATH"
#fi

# set PATH to include texlive
#Set default terminal
#gsettings set org.gnome.desktop.default-applications.terminal exec 'gnome-terminal'
#gsettings set org.gnome.desktop.default-applications.terminal exec 'terminator'

if [ -n "$DISPLAY" ]
then
    xset -b
    xset r rate 200 30
fi
