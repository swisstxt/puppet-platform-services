class platform_services_yum::repo::vmware_tools {
  yum::repo{'vmware-tools':
    descr => 'VMware Tools',
    baseurl => "http://packages.vmware.com/tools/esx/latest/rhel${::lsbmajdistrelease}/${::architecture}",
    enabled => 1,
    priority => 30,
    gpgcheck => 0,
  }
}
