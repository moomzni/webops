class nginx {

  include nginx::package, nginx::config, nginx::service

  Class['nginx::package'] -> Class['nginx::config'] ~> Class['nginx::service']

}
