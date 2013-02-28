class platform_services_icinga::server::timeperiods inherits icinga::defaults::timeperiods {
  Nagios_timeperiod['nonworkhours']{
      monday      => '04:00-09:00,19:00-22:00',
      tuesday     => '04:00-09:00,19:00-22:00',
      wednesday   => '04:00-09:00,19:00-22:00',
      thursday    => '04:00-09:00,19:00-22:00',
      friday      => '04:00-09:00,19:00-22:00',
      saturday    => '04:00-22:00',
      sunday      => '04:00-22:00',
  }
}
