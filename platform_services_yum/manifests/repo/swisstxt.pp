class platform_services_yum::repo::swisstxt {
  yum::repo{'swisstxt':
    descr => 'SWISS TXT Yum Repostory',
    baseurl => "http://yum.swisstxt.ch/centos.${lsbmajdistrelease}.${architecture}.swisstxt",
    enabled => 1,
    priority => 1,
    gpgcheck => 0,
  }
}
