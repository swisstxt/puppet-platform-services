class platform_services_yum::repo::platform_services::server {
  include apache
  include platform_services_firewall::http

  package{'createrepo':
    ensure => present,
  }
  file{[
    '/srv/yum',
    '/srv/yum/centos.6.x86_64',
  ]:
    ensure => directory,
  }->
  file{'/srv/yum/centos.6.x86_64/RPMS':
    recurse => true,
    replace => false, # don't change the content
    audit => content, # monitor for changes
  }~>
  exec{'create_repo':
    command => '/usr/bin/createrepo /srv/yum/centos.6.x86_64',
    refreshonly => true,
  }->
  ::apache::site{'yumrepo':
    servername => $servername,
    docroot => '/srv/yum',
  }
}
