#!/bin/bash

if [ ! -e /etc/bootstrapped ]; then

  apt-get update && apt-get install -y wget make ruby1.9.1-dev rubygems

  # set version of ruby to 1.9.1

  update-alternatives --set ruby /usr/bin/ruby1.9.1 && update-alternatives --set gem /usr/bin/gem1.9.1

  cd /tmp && wget -nc -nv http://apt.puppetlabs.com/puppetlabs-release-precise.deb
  dpkg -i puppetlabs*.deb

  apt-get update && apt-get install -y puppet-common

  # Install eyaml encryption backend
  gem install hiera-eyaml

  # Create keys for encryption
  cd /etc/puppet && eyaml createkeys -q && chmod 550 keys && chmod 440 ./keys/* && chown -R root:root /etc/puppet

  touch /etc/bootstrapped
fi

cp -Rv /vagrant/puppet/hiera.yaml /etc/puppet && puppet apply /etc/puppet/manifests/site.pp
