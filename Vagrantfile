# -*- mode: ruby -*-
# vi: set ft=ruby :

# $ruby_versions ||= ["2.2.3", "9.0.3.0"]
$email    ||= 'roberto@vasquez-angel.de'
$fullname ||= 'Roberto Vasquez Angel'

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "chad-thompson/ubuntu-trusty64-gui"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
    vb.name = "Development (Ubuntu 14.04 LTS)"

    # Display the VirtualBox GUI when booting the machine
    vb.gui = true
  
    # Customize the amount of memory on the VM:
    vb.memory = "8192"

    vb.cpus = 2

    vb.customize ["modifyvm", :id, "--vram", "128"]
    vb.customize ["modifyvm", :id, "--accelerate3d", "on"]
    vb.customize ['modifyvm', :id, '--clipboard', 'bidirectional']   
  end

  config.vm.network "forwarded_port", host: 3000, guest: 3000
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   sudo apt-get update
  #   sudo apt-get install -y apache2
  # SHELL

  config.vm.provision :shell, privileged: false, inline: <<-SHELL
    cd ~
    pwd
  SHELL

  config.vm.provision :shell do |s|
    s.path = 'vagrant/provision.sh'
  end

  config.vm.provision(:shell, privileged: false) do |s|
    s.path = 'vagrant/user-config.sh'
  end

  # # Install git
  # config.vm.provision :shell, :inline => "apt-get install -y git"

  # # Set git preferences
  # config.vm.provision :shell, :inline => "git config --global user.email \"#{$email}\" && git config --global user.name \"#{$fullname}\""

  # # Install tig
  # config.vm.provision :shell, inline: 'cd && sudo apt-get install -y tig'

  # # Install docker
  # pkg_cmd = "wget -q -O - https://get.docker.io/gpg | apt-key add -;" \
  #   "echo deb http://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list;" \
  #   "apt-get update -qq; apt-get install -q -y --force-yes lxc-docker; "
  # config.vm.provision :shell, :inline => pkg_cmd

  # # Add the vagrant user to the docker group
  # config.vm.provision :shell, :inline => 'sudo usermod -aG docker vagrant'

  # # Install RVM
  # config.vm.provision :shell, :inline => "apt-get install -y curl"
  # config.vm.provision :shell, :inline => "gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3"
  # config.vm.provision :shell, :inline => "\\curl -sSL https://get.rvm.io | bash", privileged: false
  
  # # Install ruby 2.2.3
  # config.vm.provision :shell, :inline => "rvm install 2.2.3"

  # # Install jruby 9.0.3.0
  # config.vm.provision :shell, :inline => "rvm install 9.0.3.0"

  # # Set ruvy 2.2.3 as default
  # config.vm.provision :shell, :inline => "rvm --default use 2.2.3"

  # # Install a better prompt
  # config.vm.provision :shell, inline: 'cd && git clone https://github.com/nojhan/liquidprompt.git && echo "[[ $- = *i* ]] && source ~/liquidprompt/liquidprompt" > ~/.bashrc'

  # # Install nodejs
  # config.vm.provision :shell, inline: 'cd && curl -sL https://deb.nodesource.com/setup_0.12 | sudo bash - && sudo apt-get install -y nodejs'

  # # Install german language pack
  # config.vm.provision :shell, inline: 'cd && sudo apt-get install -y language-pack-de'

  # # Install sublime 3
  # config.vm.provision :shell, inline: 'cd && sudo apt-add-repository -y ppa:webupd8team/sublime-text-3 && sudo apt-get update && sudo apt-get install -y sublime-text-installer'
end
