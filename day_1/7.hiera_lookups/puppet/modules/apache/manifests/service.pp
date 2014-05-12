class apache::service {

  service { 'apache2' :
    ensure  => running,
    restart => 'service apache2 reload',
  }

}
