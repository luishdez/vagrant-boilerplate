# manifest/default.pp
node default {

  include repositories
  include basic
  include php

  service { 'iptables':
    ensure => 'stopped',
    enable => false,
  }

  httpd::setup { 'httpdInstall':
    httpdSetup => {
      'Listen' => '*:80'
    }
  }

  httpd::vhost::add { 'localhost.dev':
    ip => '192.168.33.10',
  }
}