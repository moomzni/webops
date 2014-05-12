#!/bin/bash

if [ ! -e /etc/bootstrapped ]; then

  apt-get update && apt-get install -y wget curl

  cd /tmp && wget -nc -nv http://apt.puppetlabs.com/puppetlabs-release-precise.deb
  dpkg -i puppetlabs*.deb

  apt-get update && apt-get install -y puppet-common

  touch /etc/bootstrapped
fi

puppet apply /etc/puppet/manifests/site.pp
