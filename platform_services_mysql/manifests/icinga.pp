class platform_services_mysql::icinga {
  include platform_services_mysql
  mysql::db{'icinga':
    user => 'icinga',
    password => 'yodhiWoHicPo',
    host => 'localhost',
    grant => ['all'],
  }
  mysql::db{'icingaweb':
    user => 'icingaweb',
    password => 'PephlerWalyi',
    host => 'localhost',
    grant => ['all'],
  }
}
