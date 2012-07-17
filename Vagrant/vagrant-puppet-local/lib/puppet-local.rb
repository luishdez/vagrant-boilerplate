require 'vagrant'
require 'Vagrant/vagrant-puppet-local/lib/middleware/up'
require 'Vagrant/vagrant-puppet-local/lib/middleware/destroy'
require 'Vagrant/vagrant-puppet-local/lib/configuration'

Vagrant.config_keys.register(:puppet_local) { VagrantPuppetLocal::Configuration }

Vagrant.actions[:start].insert_before Vagrant::Action::VM::Provision, VaggrantPuppetLocal::Middleware::Up
Vagrant.actions[:destroy].insert_after Vagrant::Action::VM::Destroy, VaggrantPuppetLocal::Middleware::Destroy

I18n.load_path << File.expand_path("../../locales/en.yml", __FILE__)