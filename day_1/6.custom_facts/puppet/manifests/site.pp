node default {

  package { 'vim' : ensure => latest, }

  case $::hostname {
    node1   : { include nginx }
    node2   : { include apache }
    default : { }
  }

  case $::kainos_database_type {
    mongodb:    { package { 'mongodb' : ensure => 'latest', } }
    postgresql: { package { 'postgresql-9.1' : ensure => 'latest', } }
    default:    { }
  }
}
