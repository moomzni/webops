class nginx::config {

  file{ '/etc/nginx' :
    ensure => directory,
  }

  file { '/etc/nginx/nginx.conf' :
    ensure  => file,
    content => template('nginx/nginx.conf.erb'),
    require => File['/etc/nginx'],
  }

  file {
    [
      '/etc/nginx/sites-enabled',
      '/etc/nginx/sites-available',
    ] :
    ensure  => directory,
    recurse => true,
    purge   => true,
    force   => true,
    require => File['/etc/nginx'],
  }

  file { '/var/www' :
    ensure  => directory,
    owner   => 'www-data',
    group   => 'root',
    mode    => '0550',
    recurse => true,
  }

}
