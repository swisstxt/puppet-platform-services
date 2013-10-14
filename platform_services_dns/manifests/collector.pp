class platform_services_dns::collector {
  Platform_services_dns::Member::Zone::Export <<||>> {
    require => Class['::platform_services_dns'],
    notify  => Class['::dns::server::service']
  }
  Dns::Record::Cname <<||>>
}
