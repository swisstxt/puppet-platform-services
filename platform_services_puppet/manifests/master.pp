class platform_services_puppet::master {
  include ::platform_services_mysql::puppetmaster
  include ::platform_services_firewall::puppetmaster

  include ::ruby::mysql
  package{'rubygem-activerecord':
    ensure => present,
  }

  include ::puppet
  class{'::puppet::server':
    master_template => 'platform_services_puppet/puppet.conf.master.erb',
    git_repo => true,
  }

  $server_nr = regsubst($::hostname, '^-(\d+)$', '\1')
  unless has_key($::puppet_vips, $server_nr) {
    fail("must provide puppet_vip for puppet server nr $server_nr")
  }

  platform_services_dns::member::vip{$::hostname:
    vip => $::puppet_vips[$server_nr],
  }
  class{'::platform_services_cloudstack::port_forwarding::puppetmaster':
    vip => $::puppet_vips[$server_nr],
  }
}
