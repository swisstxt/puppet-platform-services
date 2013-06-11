class platform_services_cloudstack::controller {
  $cloudstack_api_key = hiera('cloudstack_api_key', false)
  $cloudstack_secret_key = hiera('cloudstack_secret_key', false)

  if $cloudstack_api_key and $cloudstack_secret_key {
    class{'::cloudstack::controller':
      url => 'https://cloud.swisstxt.ch/client/api',
      api_key => $cloudstack_api_key,
      secret_key => $cloudstack_secret_key,
      project => inline_template("<%= scope.lookupvar('::mpc_bu').upcase %>_<%= scope.lookupvar('::mpc_project').upcase %>"),
    }
    Cloudstack_port_forwarding <<||>>
  }
}
