class platform_services_puppet::master(
  $site_classes = undef
) {
  include ::platform_services_mysql::puppetmaster
  include ::platform_services_firewall::puppetmaster
  include ::ruby::mysql
  include ::puppet

  package{'rubygem-activerecord':
    ensure => present,
  } ->
  class{'::puppet::server':
    master_template => hiera('puppet::server::master_template', 'platform_services_puppet/puppet.conf.master.erb'),
    git_repo => false,
  } ->
  file{'/etc/puppet/autosign.conf':
    content => '*',
    owner   => root,
    group   => root,
    mode    => '0444',
  } ->
  file{'/etc/puppet/hiera.yml':
    source => 'puppet:///modules/platform_services_puppet/hiera.yml',
  }
  class{'::platform_services::vip':
    ports => 80,
  }
  @@dns::record::cname{"puppetmaster-$fqdn":
    host => 'puppet',
    zone => "${::mpc_zone}.serv.${::mpc_project}.${::mpc_bu}.mpc",
    data => $fqdn,
  }
  if $site_classes {
    class{$site_classes:}
  }
}
