# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = '2'
SYNCED_FOLDER = 'projects'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/precise64"

  config.vm.network :private_network, ip: '192.168.33.10'

  [3000].each do |port|
    config.vm.network :forwarded_port, guest: port, host: port
  end

  host_folder = "~/vfn/#{SYNCED_FOLDER}"
  vm_folder = "/home/vagrant/#{SYNCED_FOLDER}"
  config.vm.synced_folder host_folder, vm_folder, nfs: true

  config.vm.provider 'virtualbox' do |p|
    p.memory = 2048
    p.cpus = 2
  end

  #config.vm.provision "shell", inline: <<-SHELL
  #  sudo apt-get update
  #  sudo apt-get install -y htop
  #SHELL
end
