class platform_services::sanity_checks {
  define check_vars {
    unless getvar("::${name}") {
      fail("must provide top scope variable '$name'")
    }
  }
  check_vars{[
    'lsbmajdistrelease',
    'region',
    'project',
    'ue',
    'dns_vips',
    'puppet_vips',
    'monitor_vips',
    'patch_vips',
    'network_front',
  ]:}
}
