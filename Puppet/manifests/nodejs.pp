# Class: nodejs
#
#
class nodejs {

  package { 'nodejs': 
    ensure => "present",
    require => Yumrepo["remi-test"],
  }

  package { 'npm': 
    ensure => "present",
    require => [
      Package["nodejs"],
      Yumrepo["remi-test"]
    ]
  }

  exec { "install_node_less":
    command => "npm install -g less",
    path    => "/usr/local/bin/:/bin/:/usr/bin/",
    require => Package['npm']
  }
}