#
# Cookbook:: consul
# Recipe:: register 
#
# Copyright:: 2018, BaritoLog.

# Return if servers have not been configured
return if node.run_state.dig(cookbook_name, 'hosts').nil?

node[cookbook_name]['registered_services'].each do |srv|
  # Don't register service if attribute name is nil
  unless srv['name'].nil?
    service = { "service" => srv.to_hash }
    file "#{node[cookbook_name]['config_dir']}/#{srv['name']}.json" do
      content Chef::JSONCompat.to_json_pretty(service)
      owner node[cookbook_name]['user']
      group node[cookbook_name]['group']
      mode '0640'
    end
  end
end

bin = "#{node[cookbook_name]['prefix_home']}/bin/consul"

if node[cookbook_name]['registered_services'].length > 0
  # Reload Consul configurations
  execute "reload config" do
    command "#{bin} reload"
  end
end
