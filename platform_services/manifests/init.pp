class platform_services {
  $node_role = regsubst($::hostname, '^(\w+)-.*$', '\1')
  $node_nr = regsubst($::hostname, '^.*-(\d+)$', '\1')
  $vips = getvar("::${node_role}_vips")

  ::platform_services::validate_var{[
    'lsbmajdistrelease',
    'region',
    'project',
    'ue',
    'network_front',
  ]:}
}
