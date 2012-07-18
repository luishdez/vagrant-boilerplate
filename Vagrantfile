require 'Vagrant/vagrant-puppet-local/lib/puppet-local'  

Vagrant::Config.run do |config|

  config.vm.define :web do |web_config|
    web_config.vm.box     = "CentOS-6.3-x86_64-minimal"
    web_config.vm.box_url = "https://dl.dropbox.com/u/7225008/Vagrant/CentOS-6.3-x86_64-minimal.box"

    web_config.vm.customize do |vm|
      vm.name        = "app-name"    
      vm.memory_size = 1024
    end

    web_config.vm.network :hostonly, "192.168.33.10"
    web_config.vm.share_folder "app-name", "/var/www/vhosts/default/localhost.dev/httpdocs", ".", :nfs => false 


    web_config.puppet_local.puppet_destroy_path = 'Puppet/manifests/local/destroy.pp'
    web_config.puppet_local.puppet_up_path      = 'Puppet/manifests/local/up.pp'

    web_config.vm.provision :puppet, 
        :module_path => "Puppet/modules",
        :options => ["--fileserverconfig=/vagrant/PuppetRemote/conf/fileserver.conf", ] do |puppet|
      puppet.manifests_path = "Puppet/manifests"
      puppet.module_path    = "Puppet/modules"
      puppet.manifest_file  = "web.pp"
    end
  end

end