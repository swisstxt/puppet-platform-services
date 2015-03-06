class platform_services_yum::repo::vmware-tools {
  yum::repo{'vmware-tools':
    descr => 'VMware Tools',
    baseurl => "http://packages.vmware.com/tools/esx/5.5latest/rhel${lsbmajdistrelease}/${architecture}",
    enabled => 1,
    priority => 1,
    gpgcheck => 0,
  }
}
