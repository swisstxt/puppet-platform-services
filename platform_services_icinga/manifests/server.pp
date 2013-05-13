class platform_services_icinga::server(
  $site_classes = undef
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
    version => '1.6.1-1.el6.rf',
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
}
