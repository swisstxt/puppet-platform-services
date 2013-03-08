class platform_services_graylog2::server {
  include graylog2::server
  include graylog2::web

  $server_nr = regsubst($::hostname, '^.*-(\d+)$', '\1')
  unless has_key($::log_vips, $server_nr) {
    fail("must provide log_vip for log server nr $server_nr")
  }

  platform_services_dns::member::vip{$::hostname:
    vip => $::log_vips[$server_nr],
  }
  class{'::platform_services_cloudstack::port_forwarding::http':
    vip => $::log_vips[$server_nr],
  }
}
