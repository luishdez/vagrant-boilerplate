# Class: httpd
#
#
class httpd {
  package { [ "httpd" ]: ensure => present; }

  service { 'httpd':
    ensure    => running,
    enable    => true,
    subscribe => Package['httpd'],
  }

  file { "/etc/httpd/conf.d/vhost.conf":
    replace => "no",
    ensure  => "present",
    source => [
        "puppet:///files/httpd/vhosts.conf",
    ],
    mode    => 644,
  }
}