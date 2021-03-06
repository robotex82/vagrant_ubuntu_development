#!/bin/bash -xe

# Install curl
apt-get install -y curl

# Install git
apt-get install -y git

# Install tig
apt-get install -y tig

# Install german language pack
# apt-get install -y language-pack-de

# Install sublime 3
apt-add-repository -y ppa:webupd8team/sublime-text-3
apt-get update
apt-get install -y sublime-text-installer

# Install docker
wget -q -O - https://get.docker.io/gpg | apt-key add -
echo deb http://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list
apt-get update -qq
apt-get install -q -y --force-yes lxc-docker

# Add the vagrant user to the docker group
usermod -aG docker vagrant

# Install nodejs
curl -sL https://deb.nodesource.com/setup_0.12 | sudo bash -
apt-get install -y nodejs

# Install ruby prerequisites
apt-get install -y build-essential bison openssl libreadline6 libreadline6-dev curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libxml2-dev autoconf libc6-dev ncurses-dev automake libtool

# Install RedCloth prerequisites
apt-get install -y libgmp-dev

# Install Paperclip prerequisites
apt-get install -y imagemagick

# Switch keyboard layout to german
echo -e 'XKeMODEL="pc105"' > /etc/default/keyboard
echo -e 'XKBLAYOUT="de"' >> /etc/default/keyboard
echo -e 'XKBVARIANT="nodeadkeys"' >> /etc/default/keyboard
echo -e 'XKBOPTIONS="terminate:ctrl_alt_bksp"' >> /etc/default/keyboard

# Install heroku toolbelt
wget -O- https://toolbelt.heroku.com/install-ubuntu.sh | sh
 
# Install postgres development libs
sudo apt-get install -y libpq-dev