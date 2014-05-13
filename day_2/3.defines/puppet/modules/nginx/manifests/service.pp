class nginx::service {

  service { 'nginx' :
    ensure  => running,
    restart => 'service nginx configtest && service nginx reload',
  }

}
