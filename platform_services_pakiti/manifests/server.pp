class platform_services_pakiti::server {
  include ::platform_services_mysql
  class{'::pakiti::server': 
    dbpassword => 'Orcyahisfaic',
  }
  class{'::platform_services::vip':
    ports => 80,
  }
  include ::platform_services_firewall::http
}
