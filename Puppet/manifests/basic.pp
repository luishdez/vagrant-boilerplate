# Class: basic
#
#
class basic {
  group { "puppet":
    ensure => "present",
  }

  $basicPackages = [
    "git",
    "ntp",
    "PackageKit-cron"
  ]

  package { $basicPackages: 
    ensure => "present" 
  }

  $basicServices = [ 
    "ntpd",
    "crond"
  ]

  service { $basicServices:
    enable => true,
  }
}