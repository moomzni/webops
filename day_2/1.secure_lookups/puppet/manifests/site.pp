node default {

  case $::hostname {
    node1: { include nginx }
    node2: { include apache }
  }
}
