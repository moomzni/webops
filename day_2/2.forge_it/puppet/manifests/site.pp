node default {

  case $::hostname {
    node1: { include nginx }
  }
}
