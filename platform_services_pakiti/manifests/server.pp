class platform_services_pakiti::server {
  include ::platform_services_mysql
  include ::platform_services_firewall::http

  class{'::pakiti::server': 
    dbpassword => 'Orcyahisfaic',
  }

  $server_nr = regsubst($::hostname, '^.*-(\d+)$', '\1')
  unless has_key($::patch_vips, $server_nr) {
    fail("must provide patch_vip for patch server nr $server_nr")
  }

  platform_services_dns::member::vip{$::hostname:
    vip => $::patch_vips[$server_nr],
  }
  class{'::platform_services_cloudstack::port_forwarding::http':
    vip => $::patch_vips[$server_nr],
  }
}
