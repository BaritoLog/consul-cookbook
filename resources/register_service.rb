property :configs, 	Array, default: [], required: true
property :config_dir, 	String, required: true
property :exec_file, 	String, required: true
property :user, 	String, required: true
property :group, 	String, required: true

action :run do
  new_resource.configs.each do |config|
    name = config['name']

    # Create service configuration file
    config = { "service" => config }
    file "#{new_resource.config_dir}/#{new_resource.name}.json" do
      content Chef::JSONCompat.to_json_pretty(config)
      owner new_resource.user
      group new_resource.group
      mode '0640'
    end
  end

  # Reload Consul configuration
  execute "reload config" do
    command "#{new_resource.exec_file} reload"
  end
end
