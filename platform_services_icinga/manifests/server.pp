class platform_services_icinga::server {
  include ::platform_services_icinga
  include ::platform_services_firewall::http

  class{'::icinga':
    # rpmforge has incomplete package sets
    # this version has a complete packages set
    version => '1.6.1-1.el6.rf',
  }
  class{'::icinga::web':
    webserver => 'apache',
    servername => $::fqdn,
  }

  include ::platform_services_mysql::icinga
  include ::platform_services_icinga::server::commands
  include ::platform_services_icinga::server::timeperiods
  include ::platform_services_icinga::server::contacts
  include ::platform_services_icinga::server::contactgroups

  class{'::platform_services::vip':
    ports => 80,
  }
}
