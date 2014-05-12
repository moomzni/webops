node default {

  package { [ 'zip', 'nginx-full', 'vim', ] :
    ensure   => latest,
    provider => apt,
  }

}
