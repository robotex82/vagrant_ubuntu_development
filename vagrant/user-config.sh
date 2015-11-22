#!/bin/bash -x -e

git config --global user.email "roberto@vasquez-angel.de"
git config --global user.name "Roberto Vasquez Angel"

# Install RVM
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash
source "$HOME/.rvm/scripts/rvm"
  
# Install ruby 2.2.3
rvm install 2.2.3

# Install jruby 9.0.3.0
rvm install 9.0.3.0

# Set ruby 2.2.3 as default
rvm --default use 2.2.3

# Install a better prompt
git clone https://github.com/nojhan/liquidprompt.git
echo "[[ $- = *i* ]] source ~/liquidprompt/liquidprompt" > ~/.bashrc

  
