class openssh::service {

  service { 'ssh' :
    ensure  => running,
  }

}
