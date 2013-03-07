class platform_services_mysql::pakiti {
  include platform_services_mysql

  $dbname = 'pakiti'
  $dbuser = 'pakiti'
  $dbpassword = 'RamragAfyoj2'
  $dbserver = 'localhost'

  mysql::db{$dbname:
    user => $dbuser,
    password => $dbpassword,
    host => $dbserver,
    grant => ['all'],
  }
}
