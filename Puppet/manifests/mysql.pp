include mysql

class { 'mysql::server':
  config_hash => { 
    'root_password' => 'password',
    'bind_address'  => 'UNSET'
  }
}

mysql::db { 'default_database':
  user     => 'admin',
  password => 'password',
  host     => '%',
  grant    => ['all'],
  notify   => Service['httpd']
}