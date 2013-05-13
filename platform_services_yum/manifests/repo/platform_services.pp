class platform_services_yum::repo::platform_services {
  yum::repo{'platform-services':
    descr => 'platform-services Yum Repostory',
    baseurl => "http://${servername}/centos.${lsbmajdistrelease}.${architecture}",
    enabled => 1,
    priority => 1,
    gpgcheck => 0,
  } ->
  augeas{'yumrepo: skip_if_unavailable':
    context => '/files/etc/yum.repos.d/platform-services.repo/platform-services',
    changes => 'set skip_if_unavailable 1',
  } -> Package <| (title != 'ruby-augeas' and title != 'yum-priorities') |>
}
