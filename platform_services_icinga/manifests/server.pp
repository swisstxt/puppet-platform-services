class platform_services_icinga::server(
  $site_classes = undef
  $version      = '1.5.1-1.el6.rf'
) {
  include ::platform_services_firewall::http
  include ::platform_services_mysql::icinga

  Icinga::Service {
    use => 'generic-service',
    use_nrpe => true,
  }
  class{'::icinga':
    # rpmforge has incomplete package sets
    # this version has a complete packages set
    version => $version,
  }
  class{'::icinga::web':
    webserver => 'apache',
    servername => $::fqdn,
  }
  class{'::platform_services::vip':
    ports => 80,
  }
  if $site_classes {
    class{$site_classes:}
  }

  yum::versionlock{'icinga':
    ensure => $version
  }

}
