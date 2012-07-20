# Class: basic
#
#
class basic {

  $basicPackages = [
    "git", "ntp", "PackageKit-cron"
  ]

  package { $basicPackages:
    ensure => "present"
  }

  service { 'ntpd':
    ensure    => running,
    enable    => true,
    require   => Package['PackageKit-cron'],
    subscribe => Package['ntp'],
  }

  service { 'crond':
    ensure    => running,
    enable    => true,
    require   => Package['PackageKit-cron'],
    subscribe => Package['ntp'],
  }

  package { "update-pcre":
    provider => rpm,
    ensure   => latest,
    source   => "ftp://ftp.pbone.net/mirror/ftp.sourceforge.net/pub/sourceforge/l/li/linuxrpms/centos5/pcre/pcre-8.12-1.x86_64.rpm",
  }
}