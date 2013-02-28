class platform_services_mysql::puppetmaster {
  include platform_services_mysql

  $dbname = 'puppet'
  $dbuser = 'puppet'
  $dbpassword = 'Erfyithfadye'
  $dbserver = 'localhost'

  mysql::db{$dbname:
    user => $dbuser,
    password => $dbpassword,
    host => $dbserver,
    grant => ['all'],
  }
}
