# manifest/default.pp
node default {
  include repositories
  include basic
  include php
  include httpd

  service { 'iptables':
    ensure => 'stopped',
    enable => false,
  }

  httpd::vhost::add { 'localhost.vhost':
    ip => '192.168.33.10',
  }
}