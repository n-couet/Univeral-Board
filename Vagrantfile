# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.usable_port_range = (2200..2299)
  config.vm.network "forwarded_port", guest: 80, host: 2280, auto_correct: true
  config.vm.network "forwarded_port", guest: 3306, host: 2206, auto_correct: true

  config.vm.box = "ubuntu/trusty32"

  config.vm.synced_folder ".", "/vagrant", :mount_options => ["dmode=777","fmode=666"]

  config.ssh.forward_agent = true

  config.vm.provider "virtualbox" do |vbox|
    vbox.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vbox.memory = "1024"
  end

  if File.exist?(".vagrant/.gitconfig") then
	  config.vm.provision "file", source: ".vagrant/.gitconfig", destination: "~/.gitconfig"
  end
  if File.exist?(".vagrant/.bashrc") then
	  config.vm.provision "file", source: ".vagrant/.bashrc", destination: "~/.bashrc"
  end
  if File.exist?(".vagrant/.bash_aliases") then
	  config.vm.provision "file", source: ".vagrant/.bash_aliases", destination: "~/.bash_aliases"
  end
  if File.exist?(".vagrant/.git-prompt.sh") then
  	config.vm.provision "file", source: ".vagrant/.git-prompt.sh", destination: "~/.git-prompt.sh"
  end
  config.vm.provision "shell", path: "vagrant/provisionning.sh"
end

