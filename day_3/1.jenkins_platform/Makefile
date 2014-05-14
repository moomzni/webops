# Makefile for Puppet code
# ---------------------------------------------------------------------
# Invocation targets:
#   make            Build puppet code into deb file
#   make clean      Remove all debs artifacts
# ---------------------------------------------------------------------
#

BUILD=0.1

puppet-code_$(BUILD)_all.deb:
	fpm -f -s dir -t deb -n puppet-code -a all -v $(BUILD) --prefix /etc/puppet -C puppet hieradata manifests modules hiera.yaml

.PHONY: clean
clean:
	rm -f *.deb
