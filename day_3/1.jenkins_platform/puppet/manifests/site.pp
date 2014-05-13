node default {

  package { [ 'curl', 'vim' ] : ensure => latest, }

  case $::kainos_class {
    nginx   : {

      class { 'nginx' :
        confd_purge => true,
        vhost_purge => true,
      }

      nginx::resource::upstream { 'jenkins_app':
        members => [ '192.168.99.11:8080', ],
      }

      nginx::resource::vhost { 'jenkins_proxy':
        ensure      => present,
        proxy       => 'http://jenkins_app',
        listen_ip   => '*',
        listen_port => hiera('nginx_http'),
        access_log  => '/var/log/nginx/jenkins-access.log',
        error_log  => '/var/log/nginx/jenkins-error.log',
      }

    }
    jenkins : { include jenkins, jenkins::master }
  }
}
