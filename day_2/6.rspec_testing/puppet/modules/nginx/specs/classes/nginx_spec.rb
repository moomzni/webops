require_relative '../../../../spec_helper'

describe 'nginx', :type => :class do

  it do
    should contain_package('nginx').with_ensure('latest')
    should contain_file('/etc/nginx/nginx.conf')
    should contain_service('nginx').with_ensure('running')
  end
end
