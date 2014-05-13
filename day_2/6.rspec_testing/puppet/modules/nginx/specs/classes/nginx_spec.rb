require_relative '../../../../spec_helper'

describe 'nginx', :type => :class do
  it do
    should contain_package('nginx').with_ensure('latest').with_provider('apt')

    should contain_file('/etc/nginx/nginx.conf')

    should contain_file('/etc/nginx/sites-available', '/etc/nginx/sites-enabled').with_ensure('directory')

    should contain_service('nginx').with_ensure('running')
  end
end
