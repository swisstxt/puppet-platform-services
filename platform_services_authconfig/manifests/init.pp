class platform_services_authconfig {
  file{'/etc/openldap/cacerts/DigiCertHighAssuranceEVRootCA.crt':
    source => 'puppet:///modules/platform_services_authconfig/cacerts/DigiCertHighAssuranceEVRootCA.crt',
    owner  => root,
    group  => root,
    mode   => '0644';
  } ~>
  file{'/etc/openldap/cacerts/DigiCertHighAssuranceCA-3.crt':
    source => 'puppet:///modules/platform_services_authconfig/cacerts/DigiCertHighAssuranceCA-3.crt',
    owner  => root,
    group  => root,
    mode   => '0644';
  } ~>
  exec { 'cacertdir_rehash /etc/openldap/cacerts/':
    refreshonly => true,
    path        => '/usr/sbin',
  } ~>
  class{'authconfig':
    mkhomedir      => hiera('mkhomedir', true),
    ldaptls        => hiera('ldaptls', true),
    ldapserver     => hiera('ldapserver', 'ldap.swisstxt.ch'),
    sssd_enumerate => hiera('sssd_enumerate', true),
  }
}
