# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# This defines the version of vagrant
Vagrant.configure("2") do |config|

MACHINE = ["slave1","slave2","master"]
N = 2

(0..N).each do |i|

  config.vm.define "#{MACHINE[i]}" do |node|
  node.vm.hostname = MACHINE[i]
  node.vm.box = "ubuntu/focal64"
  node.vm.network :private_network, ip: "192.168.33.#{10+i}"

  if (i == 0)
  node.vm.provider "virtualbox" do |vb|
  vb.memory = "2048"
  end
  node.vm.provision "shell", path: "mongodbslave1.sh"


  else if (i == 1)
  node.vm.provider "virtualbox" do |vb|
  vb.memory = "2048"
  end
  node.vm.provision "shell", path: "mongodbslave2.sh"


  else
  node.vm.provider "virtualbox" do |vb|
  vb.memory = "2048"
  end
  node.vm.provision "shell", path: "mongodbmaster.sh"



end
end
end
end
end