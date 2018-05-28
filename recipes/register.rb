#
# Cookbook:: consul
# Recipe:: register 
#
# Copyright:: 2018, BaritoLog.

# Return if servers have not been configured
return if node.run_state.dig(cookbook_name, 'hosts').nil?

node[cookbook_name]['registered_services'].each do |srv|
  service = srv.to_hash
  file "#{node[cookbook_name]['config_dir']}/#{service['name']}.json" do
    content Chef::JSONCompat.to_json_pretty(service)
    owner node[cookbook_name]['user']
    group node[cookbook_name]['group']
    mode '0640'
  end
end
