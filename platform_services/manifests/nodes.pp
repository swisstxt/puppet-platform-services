class platform_services::nodes {
  include platform_services

  node /^puppet(-\w+)?(-?\d+)?\./ {
    unless hiera('platform_services_puppet::master::disable', false) {
      include ::platform_services_puppet::master
    }
    # TODO: Fix cloustack provider
    # include ::platform_services_cloudstack::controller
    if $osfamily == 'RedHat' {
      include ::platform_services_yum::repo::platform_services::server
    }
    include ::platform_services_cloudstack::controller
    include ::platform_services::base
  }
  node /^dns(-\w+)?(-?\d+)?\./ {
    include ::platform_services_dns::server
    include ::platform_services::base
  }
  node /monitor(-\w+)?(-?\d+)?\./ {
    include ::platform_services_icinga::server
    include ::platform_services::base
  }
  node /^log(-\w+)?(-?\d+)?\./ {
    include ::platform_services_graylog2::server
    include ::platform_services::base
  }
  node /^patch(-\w+)?(-?\d+)?\./ {
    include ::platform_services_pakiti::server
    include ::platform_services::base
  }
  node /^haproxy(-\w+)?(-?\d+)?\./ {
    include ::platform_services_haproxy::server
    include ::platform_services::base
  }
}
