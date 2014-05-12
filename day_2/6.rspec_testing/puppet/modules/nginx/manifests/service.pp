class nginx::service {

  service { 'nginx' :
    ensure  => running,
    restart => 'service nginx reload',
  }

}
