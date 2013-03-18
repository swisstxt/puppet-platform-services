class platform_services_puppet::master {
  include ::platform_services_mysql::puppetmaster
  include ::platform_services_firewall::puppetmaster

  include ::ruby::mysql
  package{'rubygem-activerecord':
    ensure => present,
  }

  include ::puppet
  class{'::puppet::server':
    master_template => hiera('puppet::server::master_template', 'platform_services_puppet/puppet.conf.master.erb'),
    git_repo => true,
  }

  class{'::platform_services::vip':
    ports => 80,
  }
  @@dns::record::cname{"puppetmaster-$fqdn":
    host => 'puppet',
    zone => "${::region}.serv.${::project}.${::ue}.mpc",
    data => $fqdn,
  }
}
