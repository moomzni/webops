#!/bin/bash

set -e

die () {
    echo >&2 "Error: $@"
    help
    exit 1
}

if [ ! -e /etc/bootstrapped ]; then

  case $HOSTNAME in
    node1)
      KAINOS_CLASS=nginx
    ;;
    node2)
      KAINOS_CLASS=jenkins
    ;;
    *)
      die [* ERROR: Skipping provision as hostname \"$HOSTNAME\" is not recognised *]
    ;;
  esac

  apt-get update && apt-get install -y wget make ruby1.9.1-dev rubygems

  # set version of ruby to 1.9.1

  update-alternatives --set ruby /usr/bin/ruby1.9.1 && update-alternatives --set gem /usr/bin/gem1.9.1

  cd /tmp && wget -nc -nv http://apt.puppetlabs.com/puppetlabs-release-precise.deb
  dpkg -i puppetlabs*.deb

  apt-get update && apt-get install -y puppet-common

  export FACTER_kainos_class=$KAINOS_CLASS && echo FACTER_kainos_class=$KAINOS_CLASS >> /etc/environment

  set -a
  . /etc/environment
  set +a

  touch /etc/bootstrapped

fi

dpkg -i /vagrant/puppet-code_0.1_all.deb > /dev/null

puppet apply /etc/puppet/manifests/site.pp
