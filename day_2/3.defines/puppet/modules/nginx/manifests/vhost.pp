define nginx::vhost(
  $vhost_name = $title,
  $port       = '',
  $servername =  "${title}.${::hostname}",
  $content    = undef,
) {

  if $content == undef { fail("No nginx configuration given for vhost ${vhost_name}") }

  file { "/etc/nginx/sites-available/${vhost_name}" :
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('nginx/vhost.erb'),
    notify  => Service['nginx'],
  }

  file { "/etc/nginx/sites-enabled/${vhost_name}" :
    ensure  => link,
    target  => "/etc/nginx/sites-available/${vhost_name}",
    require => File["/etc/nginx/sites-available/${vhost_name}"],
    notify  => Service['nginx'],
  }
}
