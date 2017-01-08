# # encoding: utf-8

# Inspec test for recipe reverseproxy::default

# The Inspec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec_reference.html

unless os.windows?
  describe user('root') do
    it { should exist }
    skip 'This is an example test, replace with your own test.'
  end
end

describe port(80) do
  it { should_not be_listening }
  skip 'This is an example test, replace with your own test.'
end

describe file('/etc/httpd/conf.d/r_proxy.conf') do
  its(:content) { should match /ProxyPass/ }
  skip 'Reverse Proxy is setup'
end

describe port(389) do
  it { should be_listening }
  skip 'LDAP Port 389 is running'
end

describe file('/etc/httpd/conf.d/phpldapadmin.conf') do
  its(:content) { should match /Require all granted/ }
  skip 'phpLDAPadmin is accessible'
end
