class openssh::config {

  file { '/etc/ssh/sshd_config' :
    ensure  => file,
    content => template('openssh/sshd_config.erb'),
  }

}
