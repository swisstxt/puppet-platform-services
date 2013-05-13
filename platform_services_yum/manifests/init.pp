class platform_services_yum {
  include ::yum::autoupdate
  if $::lsbmajdistrelease == 5 {
    include ::yum::updatesd::disable
  }
  include ::yum::repo::dist
  include ::yum::repo::epel
  include ::yum::repo::puppetlabs
  class{'::yum::repo::rpmforge':
    includepkgs => 'icinga*',
  }
  include ::platform_services_yum::repo::swisstxt
  #include ::platform_services_yum::repo::platform_services
}
