class platform_services_rsyslog {
  include ::rsyslog::base
  ::rsyslog::config {'graylog2':
    content => "*.* @log-${::mpc_zone}-01",
    order   => '10',
  }
} 
