class platform_services::nodes {
  node /^puppet(-\w+)?(-?\d+)?\./ {
    include ::platform_services_puppet::master
    include ::platform_services_cloudstack::controller
    include ::platform_services_base
  }
  node /^dns(-\w+)?(-?\d+)?\./ {
    include ::platform_services_dns::server
    include ::platform_services_base
  }
  node /monitor(-\w+)?(-?\d+)?\./ {
    include ::platform_services_icinga::server
    include ::platform_services_base
  }
  node /^log(-\w+)?(-?\d+)?\./ {
    include ::platform_services_graylog2::server
    include ::platform_services_base
  }
  node /^patch(-\w+)?(-?\d+)?\./ {
    include ::platform_services_pakiti::server
    include ::platform_services_base
  }
  node /^haproxy(-\w+)?(-?\d+)?\./ {
    include ::platform_services_haproxy::server
    include ::platform_services_base
  }
}
