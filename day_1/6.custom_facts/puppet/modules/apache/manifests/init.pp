class apache {

  include apache::package, apache::config, apache::service

  Class['apache::package'] -> Class['apache::config'] ~> Class['apache::service']

}
