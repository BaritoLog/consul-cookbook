property :configs, Hash, default: {}, required: true
property :config_dir, String, required: true
property :exec_file, String, required: true
property :user, String, required: true
property :group, String, required: true

action :run do
  configs.each do |config|
    name = config['name']
    # Create service configuration file
    config = { "service" => config }
    file "#{config_dir}/#{name}.json" do
      content Chef::JSONCompat.to_json_pretty(config)
      owner user
      group group
      mode '0640'
    end
  end

  # Reload Consul configuration
  execute "reload config" do
    command "#{exec_file} reload"
  end
end
