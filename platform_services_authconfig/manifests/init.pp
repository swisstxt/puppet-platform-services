class platform_services_authconfig {
  host{'dirsrv01.stxt.mpc':
    ip => '10.100.219.85',
  } ~>
  class{'authconfig':
    sssd => hiera('sssd', true),
    sssdauth => hiera('sssdauth', true),
    mkhomedir => hiera('mkhomedir', true),
    ldaptls => hiera('ldaptls', true),
    ldapserver => hiera('ldapserver', 'dirsrv01.stxt.mpc'),
    ldaploadcacert => hiera('ldaploadcacert', 'https://gist.github.com/turingmachine/5433495/raw/b8ca08ecc652266eed3d32aefd8f506d7ea6b722/siwsstxtCA'),
    sssd_enumerate => hiera('sssd_enumerate', true),
  }
}
