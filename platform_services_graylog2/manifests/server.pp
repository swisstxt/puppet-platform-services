class platform_services_graylog2::server {
  include ::graylog2::server
  include ::graylog2::web
  include ::platform_services_firewall::http
  class{'::platform_services::vip':
    ports => 8140,
  }
}
