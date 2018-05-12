# # encoding: utf-8

# Inspec test for recipe consul-cookbook::default

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

