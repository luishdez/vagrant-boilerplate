# manifest/default.pp
node default {
  include repositories
  include basic
  include php
  include httpd

  httpd::vhost::add { 'test.vhost': }

}