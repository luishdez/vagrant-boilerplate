# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|

  config.vm.box = "CentOS-6.3-x86_64-minimal"
  config.vm.box_url = "https://dl.dropbox.com/u/7225008/Vagrant/CentOS-6.3-x86_64-minimal.box"

  #config.vm.host_name = "app-name"

  config.vm.customize do |vm|
    vm.name        = "app-name"    
    vm.memory_size = 1024
  end

  config.vm.network :hostonly, "192.168.33.10"
  config.vm.forward_port 80, 8080

  config.vm.share_folder "app-name", "/var/www/vhosts", ".", :nfs => false 

  config.vm.provision :puppet, :module_path => "Puppet/modules" do |puppet|
    puppet.manifests_path = "Puppet/manifests"
    puppet.module_path    = "Puppet/modules"
    puppet.manifest_file  = "default.pp"
  end

end
