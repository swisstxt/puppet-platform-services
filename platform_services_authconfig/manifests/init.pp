class platform_services_authconfig {

  host{'dirsrv01.stxt.mpc':
    ip => '10.100.219.85',
  } ~>
  file{'/etc/openldap/certs/cacert.pem':
    source => [
      "puppet:///modules/site_authconfig/cacerts/${::fqdn}/cacert.pem",
      'puppet:///modules/site_authconfig/cacerts/cacert.pem',
      'puppet:///modules/platform_services_authconfig/cacerts/cacert.pem'
    ],
    owner  => root,
    group  => 0,
    mode   => '0644';
  } ~>
  class{'authconfig':
    sssd           => hiera('sssd', true),
    sssdauth       => hiera('sssdauth', true),
    mkhomedir      => hiera('mkhomedir', true),
    ldaptls        => hiera('ldaptls', true),
    ldapserver     => hiera('ldapserver', 'dirsrv01.stxt.mpc'),
    ldaploadcacert => hiera('ldaploadcacert', 'file:///etc/openldap/certs/cacert.pem'),
    sssd_enumerate => hiera('sssd_enumerate', true),
  }
}
