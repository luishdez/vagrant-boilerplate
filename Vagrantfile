# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  # Box definition
  config.vm.box = "CentOS-6.6-x86_64-v20150426"
  config.vm.box_url = "https://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.6-x86_64-v20150426.box"

  # Customs for virtualBox
  config.vm.provider "virtualbox" do |v|
    v.auto_nat_dns_proxy = false
    v.customize ["modifyvm", :id, "--memory", 3048, "--cpus", 4]
    v.customize ["modifyvm", :id, "--natdnsproxy1", "off" ]
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "off" ]
    v.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/app", "1"]
  end

  # VM definition
  config.vm.network :private_network, ip: "192.168.100.210"

  # VM shared folders
  config.vm.synced_folder "www", "/var/www", nfs: true

  # VM provision by chef
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path    = ["cooknotes", "cookbooks"]
    chef.data_bags_path    = "cookbags"
    chef.provisioning_path = "/tmp/vagrant-chef"
    chef.environments_path = "environments"
    chef.roles_path        = "roles"
    chef.environment       = "dev"
    chef.add_role          "basic"
  end
end
