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
