# deploy monitoring server icinga
#
class platform_services_icinga::server::redhat{

  yum::versionlock{[
    'icinga',
    'icinga-idoutils',
    'icinga-idoutils-libdbi-mysql',
  ]:
    ensure => $::platform_services_icinga::server::version,
    before => Class['::icinga'],
  } 

  yum::versionlock{[
    'icinga',
    'icinga-idoutils',
    'icinga-idoutils-libdbi-mysql'
    ]:
    ensure => $::platform_services_icinga::server::version,
    before => Class['::icinga'],
  }
  yum::versionlock{'icinga-web':
    ensure => $::platform_services_icinga::server::web_version,
    before => Class['::icinga::web'],
  }
}
