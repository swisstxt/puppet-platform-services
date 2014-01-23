# Install Databases for Icinga and Icinga-Web.
# Deploy and execute Database migration Script.
class platform_services_mysql::icinga (
  $icinga_passwd     = 'yodhiWoHicPo',
  $icinga_web_passwd = 'PephlerWalyi',
) {
  include platform_services_mysql

  mysql::db{'icinga':
    user     => 'icinga',
    password => $icinga_passwd,
    host     => 'localhost',
    grant    => ['all'],
    notify   => Exec['icinga_db_migrate'],
  }->
  mysql::db{'icinga_web':
    user     => 'icinga_web',
    password => $icinga_web_passwd,
    host     => 'localhost',
    grant    => ['all'],
    notify   => Exec['icinga_db_migrate'],
  }->
  class{'icinga::web::dbconf':
    database     => 'icinga',
    username     => 'icinga',
    password     => $icinga_passwd,
    web_database => 'icinga_web',
    web_username => 'icinga_web',
    web_password => $icinga_web_passwd,
  }->
  file{'/usr/local/sbin/icinga_db_migrate':
    source => $::osfamily ? {
      'debian' => 'puppet:///modules/platform_services_mysql/icinga_db_migrate_Debian',
      'redhat' => 'puppet:///modules/platform_services_mysql/icinga_db_migrate_RedHat',
      },
    owner  => root,
    group  => 0,
    mode   => '0744',
    notify => Exec['icinga_db_migrate'],
  }->
  exec{'icinga_db_migrate':
    command     => '/usr/local/sbin/icinga_db_migrate >> /tmp/icinga_db_migrate.log',
    refreshonly => true,
    require     => [
      Package['icinga'],
      Package['icinga-web'],
    ],
    logoutput => true,
    notify      => Service['icinga'],
  }

}
