class yum::repo::vmware-tools(
  $priority = 30,
  $includepkgs = undef
) {
  Class['yum::repo::vmware-tools'] <- Class['yum']

  yum::repo{'vmware-tools':
    descr => 'VMware Tools',
    baseurl => 'http://packages.vmware.com/tools/esx/${esx_version}/rhel${::lsbmajdistrelease}/${::architecture}',
    enabled => 1,
    priority => $priority,
    gpgcheck => 0,
  }
}
