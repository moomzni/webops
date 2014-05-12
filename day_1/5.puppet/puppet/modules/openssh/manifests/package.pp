class openssh::package {

  package { 'openssh-server' :
    ensure   => 'latest',
    provider => apt,
  }

}
