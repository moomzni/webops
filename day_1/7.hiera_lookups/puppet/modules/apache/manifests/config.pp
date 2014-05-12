class apache::config {

  file { '/etc/apache2/apache2.conf' :
    ensure  => file,
    content => template('apache/apache2.conf.erb'),
  }

}
