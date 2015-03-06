class platform_services_vmware::redhat {
  if $::virtual == 'vmware' {
    package { 'vmware-tools-esx-nox':
      ensure => latest,
    }
  }
}
