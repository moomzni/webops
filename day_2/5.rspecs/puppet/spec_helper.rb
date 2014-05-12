require 'rspec-puppet'
require 'puppet'

RSpec.configure do |c|
  c.module_path = File.join(File.expand_path(File.dirname(__FILE__)), 'modules')
  c.manifest    = File.join(File.expand_path(File.dirname(__FILE__)), 'manifests', 'site.pp')

  c.before :each do |x|
    #
    # Enable the below for debugging purposes
    #
    # Puppet::Util::Log.level = :debug
    # Puppet::Util::Log.newdestination(:console)
  end
end
