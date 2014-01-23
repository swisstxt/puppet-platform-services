class platform_services_icinga::target::redhat (
  $yum_check = present,
) {
  icinga::service{
    'yum':
      service_description => 'Check for updates',
      check_command       => 'check_yum',
      ensure              => $yum_check,
  }
}
