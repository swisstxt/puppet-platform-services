class platform_services_icinga::server::contactgroups inherits icinga::defaults::contactgroups {
  Nagios_contactgroup['administrators']{
    ensure => absent,
  }
  nagios_contactgroup{'admins':
    members => 'franziska.muster_work,franziska.muster_free,hans.muster_work,hans.muster_free',
  }
}
