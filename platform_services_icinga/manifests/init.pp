class platform_services_icinga {
  Icinga::Service {
    use => 'generic-service',
    use_nrpe => true,
  }
}
