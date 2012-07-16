# manifest/default.pp
node default {
  include repositories
  include basic
  include php
  include httpd
  include firewall

  firewall { "00080 http on port 80":
    proto => "tcp",
    dport => "80",
    action => "accept",
    notify => Exec["iptables-save"]
  }

  exec { "iptables-save":
    command => $operatingsystem ? {
      "debian" => "/sbin/iptables-save > /etc/iptables/rules.v4",
      /(RedHat|CentOS)/ => "/sbin/iptables-save > /etc/sysconfig/iptables",
    },
    refreshonly => true,
    notify => Service["iptables"],
  }

  httpd::vhost::add { 'localhost.vhost': }
}