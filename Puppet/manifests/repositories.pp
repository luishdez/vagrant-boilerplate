# Class: repositories
#
#
class repositories {

  # yum clean metadata
  # yum clean dbcache
  # yum update
  
  yumrepo { "remi-test":
    baseurl  => "http://rpms.famillecollet.com/enterprise/6/test/$architecture/",
    descr    => "Remi Test PHP repository",
    enabled  => 1,
    gpgcheck => 0,
  }
  yumrepo { "epel":
    baseurl  => "http://download.fedoraproject.org/pub/epel/6/$architecture",
    descr    => "Epel repository",
    enabled  => 1,
    gpgcheck => 0,
  }
}