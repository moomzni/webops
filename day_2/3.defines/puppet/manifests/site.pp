node default {

  include nginx

  nginx::vhost {'website-1' :
    port    => '80',
    content => 'root /var/www/;'
  }

}
