# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/trusty64"
  config.ssh.forward_agent = true
  config.vm.synced_folder ".", "/home/vagrant/vagrant-zk-ensemble"
  config.vm.network :forwarded_port, guest: 2181,  host: 22181
  config.vm.network :forwarded_port, guest: 2182,  host: 22182
  config.vm.network :forwarded_port, guest: 2183,  host: 22183

  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
    v.name = "ZK Cluster VM"
    v.cpus = 4
  end

  # easy way to install docker on the VM and pre-download some images
  config.vm.provision "docker", images: ["ubuntu:14.04"]
  config.vm.provision "shell", path: "provision.sh"

end
