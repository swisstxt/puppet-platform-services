class platform_services_cloudstack::controller(
  class{'::cloudstack::controller':
    url => 'https://cloud.swisstxt.ch/client/api',
    api_key => '',
    secret_key => '',
    project => inline_template("<%= scope.lookupvar('::ue').capitalize %>_<%= scope.lookupvar('::project').capitalize %>"),
  }
  Cloudstack_port_forwarding <<||>>
}
