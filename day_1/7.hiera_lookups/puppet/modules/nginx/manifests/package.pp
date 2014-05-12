class nginx::package {

  $version = hiera('nginx_version')

  package { 'nginx' :
    ensure   => $version,
    provider => apt,
  }

}
