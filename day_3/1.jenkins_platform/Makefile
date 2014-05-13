# Makefile for Puppet code
# ---------------------------------------------------------------------
# Invocation targets:
#   make            Build puppet code into deb file
#   make clean      Remove all debs artifacts
# ---------------------------------------------------------------------
#

puppet-code_0.1_all.deb: prereq
	fpm -f -s dir -t deb -n puppet-code -a all -v 0.1 --prefix /etc/puppet -C puppet hieradata manifests modules hiera.yaml

.PHONY: prereq
ifneq ($(shell which bundle >/dev/null; echo $$?), 0)
prereq:
	gem install bundler
	bundle install
else
prereq:
ifneq ($(shell bundle check >/dev/null; echo $$?), 0)
	bundle install
endif
endif

.PHONY: clean
clean:
	rm -f *.deb
