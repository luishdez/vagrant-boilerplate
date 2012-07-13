# manifest/default.pp

Exec { path => "/usr/bin:/usr/sbin/:/bin:/sbin" }


    include repositories
    include basic
    include httpd
    include php

    file { "vhosts.conf":
        path    => "/etc/httpd/conf.d/vhosts.conf",
        ensure  => "present",
        require => Package["httpd"],
        owner   => "root",
        group   => "root",
        mode    => 0644,
        replace => true,
        once    => true,
        source  => [
            "puppet:///modules/httpd/vhosts.conf",
        ],
    }
