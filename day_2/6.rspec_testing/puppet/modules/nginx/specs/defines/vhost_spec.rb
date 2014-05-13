require_relative '../../../../spec_helper'

describe 'nginx::vhost', :type => :define do

  let(:title) { 'test-website' }
  let(:params) {
    {
      'port'       => '80',
      'content'    => 'location /some_location { allow all; }'
    }
  }
  it do
    should contain_file('/etc/nginx/sites-available/test-website').
      with_ensure('present').
      with_owner('root').
      with_group('root').
      with_mode('0644').
      with_content(/location \/some_location \{ allow all; \}/).
      with_content(/listen 80;/).
      with_content(/access_log \/var\/log\/nginx\/test-website-access\.log;/).
      with_content(/error_log \/var\/log\/nginx\/test-website-error\.log;/)

    should contain_file('/etc/nginx/sites-enabled/test-website').
      with_ensure('link').
      with_target('/etc/nginx/sites-available/test-website')
  end
end

describe 'nginx::vhost', :type => :define do

  let(:title) { 'caoimhin' }
  let(:params) {
    {
      'port'       => '100',
      'content'    => 'bob'
    }
  }
  it do
    should contain_file('/etc/nginx/sites-available/caoimhin').
      with_ensure('present').
      with_owner('root').
      with_group('root').
      with_mode('0644').
      with_content(/bob/).
      with_content(/listen 100;/).
      with_content(/access_log \/var\/log\/nginx\/caoimhin-access\.log;/).
      with_content(/error_log \/var\/log\/nginx\/caoimhin-error\.log;/)

    should contain_file('/etc/nginx/sites-enabled/caoimhin').
      with_ensure('link').
      with_target('/etc/nginx/sites-available/caoimhin')
  end
end