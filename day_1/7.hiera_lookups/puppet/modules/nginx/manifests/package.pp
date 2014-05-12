class nginx::package {

  package { 'nginx' :
    ensure   => 'latest',
    provider => apt,
  }

}
