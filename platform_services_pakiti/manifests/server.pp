class platform_services_pakiti::server {
  class{'::platform_services_mysql::pakiti':
  } ->
  class{'::pakiti::server': 
    dbpassword => 'Orcyahisfaic',
  }
  include ::platform_services_firewall::http
  include ::platform_services::front_ip
}
