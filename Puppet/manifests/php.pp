# Class: php
#
#
class php {
  $phpPackages = [ 
    "php",
    "php-bcmath",
    "php-cli",
    "php-devel",
    "php-common",
    "php-gd",
    "php-intl",
    "php-mbstring",
    "php-process",
    "php-xml",
    "php-mcrypt",
    "php-mysql"
  ]

  package { $phpPackages: 
    ensure  => "installed",
    require => Yumrepo["remi-test"]
  }
}