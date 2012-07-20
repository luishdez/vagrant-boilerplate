# Class: nodejs
#
#
class nodejs {

  package { 'nodejs': 
    ensure => "present",
    require => Yumrepo["nodejs-stable"],
  }

  package { 'npm': 
    ensure => "present",
    require => [
      Package["nodejs"],
      Yumrepo["nodejs-stable"]
    ]
  }

  exec { "install_node_less":
    command => "npm install -g less",
    path    => "/usr/local/bin/:/bin/:/usr/bin/",
    require => Package['npm']
  }
}