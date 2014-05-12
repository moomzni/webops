class openssh {

  include openssh::package, openssh::config, openssh::service

  Class['openssh::package'] -> Class['openssh::config'] ~> Class['openssh::service']

}
