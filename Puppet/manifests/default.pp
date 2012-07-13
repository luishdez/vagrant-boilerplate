# manifest/default.pp

Exec { path => "/usr/bin:/usr/sbin/:/bin:/sbin" }


node default {

    include repositories
    include basic
    include php
    include httpd

    apache::vhost { 'test.vhost':
      port     => 80,
      template => 'vhost.default.erb'
    }
}

