# deploy monitoring server icinga
#
class platform_services_icinga::server(
  $site_classes = undef,
  $version      = '1.8.4-4.el6.rf',
  $web_version  = '1.7.2-2.el6.rf'
) {
  include ::platform_services_firewall::http
  include ::platform_services_mysql::icinga

  Icinga::Service {
    use => 'generic-service',
    use_nrpe => true,
  }
  class{'::icinga':
    version => $version
  }
  class{'::icinga::web':
    webserver  => 'apache',
    servername => $::fqdn,
  }
  class{'::platform_services::vip':
    ports => 80,
  }
  if $site_classes {
    class{$site_classes:}
  }

  yum::versionlock{[
    'icinga',
    'icinga-idoutils',
    'icinga-idoutils-libdbi-mysql'
    ]:
    ensure => $version,
    before => Class['::icinga'],
  }

  yum::versionlock{'icinga-web':
    ensure => $web_version,
    before => Class['icinga-web'],
  }
}
