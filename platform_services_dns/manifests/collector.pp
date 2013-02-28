class platform_services_dns::collector {
  Site_dns::Member::Zone::Export <<||>> {
    require => Class['dns::server'],
    notify  => Class['dns::server::service']
  }
  Site_dns::Server::Zone <<||>>
}
