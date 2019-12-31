# # encoding: utf-8

# Inspec test for recipe consul::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

unless os.windows?
  describe group('consul') do
    it { should exist }
  end

  describe user('consul')  do
    it { should exist }
  end
end

describe package('unzip rsync') do
  it { should be_installed }
end

describe directory('/opt') do
  its('mode') { should cmp '0755' }
end

describe directory('/opt/bin') do
  its('mode') { should cmp '0755' }
end

describe file('/opt/bin/consul') do
  its('mode') { should cmp '0755' }
end

describe directory('/var/opt/consul') do
  its('mode') { should cmp '0755' }
end

describe directory('/opt/consul/etc') do
  its('mode') { should cmp '0755' }
end

describe file('/opt/consul/etc/consul.json') do
  its('mode') { should cmp '0640' }
end

describe file('/etc/systemd/resolved.conf') do
  it { should be_file }
  it { should_not be_directory }
  its('content') { should match /DNS=127.0.0.1/ }
  its('content') { should match /Domains=~consul/ }
end

describe systemd_service('consul') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end

describe command('iptables -L -t nat') do
  its('stdout') { should match /ports 8600/ }
end

describe port(8500) do
  it { should be_listening }
end

