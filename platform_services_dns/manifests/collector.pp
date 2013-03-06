class platform_services_dns::collector {
  Platform_services_dns::Member::Zone::Export <<||>> {
    require => Class['dns::server'],
    notify  => Class['dns::server::service']
  }
  Platform_services_dns::Server::Zone <<||>>
}
