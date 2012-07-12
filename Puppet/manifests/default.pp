# manifest/default.pp

Exec { path => "/usr/bin:/usr/sbin/:/bin:/sbin" }

node default {

    include repositories
    include basic
    include httpd 
    include php::cli

    php::ini { '/etc/php.ini':
        date_timezone  => 'Europe/Madrid',
        display_errors => 'Off',
        memory_limit   => '256M',
    }

    php::module {["bcmath", "devel", "gd", "intl", "mbstring",
    "process", "xml", "mcrypt", "mysql", "pecl-apc"]:}

    php::module::ini { 'pecl-apc':
        settings => {
            'apc.enabled'      => '1',
            'apc.shm_segments' => '1',
            'apc.shm_size'     => '64',
        }
    }

    class { 'php::mod_php5': inifile => '/etc/php.ini' }
}