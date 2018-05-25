#
# Cookbook:: consul
# Recipe:: systemd 
#
# Copyright:: 2018, BaritoLog.

# Return if servers have not been configured
return if node.run_state.dig(cookbook_name, 'hosts').nil?

# Construct command line options
options = node[cookbook_name]['cli_opts'].map do |key, opt|
  "-#{key.to_s.tr('_', '-')}#{" #{opt}" unless opt.nil?}"
end.join(' ')

hosts = node[cookbook_name]['hosts']
bin = "#{node[cookbook_name]['prefix_home']}/consul/consul"

# Join to each consul server
hosts.each do |host|
  execute "Join cluster" do
    command "#{bin} join #{host} #{options}"
    not_if node[cookbook_name]['run_as_server'].to_s
  end
end
