class nginx {
  package { 'nginx-full' :
    ensure => 'latest',
  }
}
