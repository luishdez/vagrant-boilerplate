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
        require => Package['PackageKit-cron'],
        subscribe => Package['ntp'],
    }

    service { 'crond':
        ensure    => running,
        enable    => true,
        require   => Package['PackageKit-cron'],
        subscribe => Package['ntp'],    
    }
}