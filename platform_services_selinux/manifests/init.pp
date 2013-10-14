class platform_services_selinux (
  $mode = 'permissive',
) {
  class {'::selinux':
    mode => $mode,
  }
}
