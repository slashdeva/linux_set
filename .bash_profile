# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bin

export PATH

#package config set - support 64bit
PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/lib/pkgconfig:/usr/lib/pkgconfig:/usr/lib64/pkgconfig
export PKG_CONFIG_PATH

#package ld path
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib:/usr/local/lib
export LD_LIBRARY_PATH

# Ctrl+s lock
stty -ixon


#virtualenv
export WORKON_HOME=$HOME/.virtualenvs
source /usr/bin/virtualenvwrapper.sh
VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3


#export WORKON_HOME=$HOME/.virtualenvs
#export PROJECT_HOME=$HOME/Devel
#export VIRTUALENVWRAPPER_SCRIPT=/usr/bin/virtualenvwrapper.sh
#source /usr/bin/virtualenvwrapper_lazy.sh

#alias mkvirtualenv2='mkvirtualenv --python=/usr/local/bin/python2'
#alias mkvirtualenv3='mkvirtualenv --python=/usr/local/bin/python3'

export LD_LIBRARY_PATH=/usr/lib:/usr/local/lib
