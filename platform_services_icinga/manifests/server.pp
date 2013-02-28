class platform_services_icinga::server {
  include ::platform_services_icinga
  class{'::icinga':
    # rpmforge has incomplete package sets
    # this version has a complete packages set
    version => '1.6.1-1.el6.rf',
  }
  class{'::icinga::web':
    webserver => 'apache',
    servername => $::fqdn,
  }
  @@class{'::icinga::nrpe':
    nrpe_allowed_hosts => "127.0.0.1, ${::ipaddress_eth0}",
  }
  include ::platform_services_mysql::icinga
  include ::platform_services_firewall::http
  include ::platform_services_icinga::server::commands
  include ::platform_services_icinga::server::timeperiods
  include ::platform_services_icinga::server::contacts
  include ::platform_services_icinga::server::contactgroups
}
