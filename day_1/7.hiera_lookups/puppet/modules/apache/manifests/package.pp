class apache::package {

  package { 'apache2' :
    ensure   => 'latest',
    provider => apt,
  }

}
