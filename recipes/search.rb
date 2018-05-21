#
# Cookbook:: consul
# Recipe:: search 
#
# Copyright:: 2018, BaritoLog.

# Keep it simple for now
node.run_state[cookbook_name] = {}
node.run_state[cookbook_name]['hosts'] = node[cookbook_name]['hosts']
