class platform_services_graylog2::server {
  include ::graylog2::server
  include ::graylog2::web
  include ::platform_services_firewall::http
  include ::platform_services_firewall::syslog
  include ::platform_services::front_ip
}
