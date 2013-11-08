# deploy monitoring server icinga
#
class platform_services_icinga::server(
  $site_classes = undef,
  $version      = '1.8.4-4.el6.rf',
  $web_version  = '1.7.2-2.el6.rf'
) {
  include ::platform_services_firewall::http
  include ::platform_services_mysql::icinga
  include ::platform_services::front_ip

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
  if $site_classes {
    class{$site_classes:}
  }
  case $::osfamily {
    'RedHat' : {
      include ::platform_services_icinga::server::redhat
    }
    default: {
      # we dont need a Versionlock in good OS 
    }
  }
}
