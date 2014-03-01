group node.app.deploy_group do
  gid 420
  members ["root"]
end

user node.app.user do
  password '$6$saltsalt$9vIXh5xFJESF2.DxxXyWlpOT.0t06Y2Pk11StIw2L8oaOTl42ZfuhPPi5h2PPjbLI.FnnhTBEMMcL05LS2ZmY.'
  gid node.app.deploy_group
  home node.app.user_home_path
  shell '/bin/bash'
  supports :manage_home => true
  system true
  action :create
end

directory "/home/#{node.app.user}/.ssh" do
  action :create
  owner node.app.user
  group node.app.deploy_group
  mode "700"
end

template "#{node.app.user_home_path}/.ssh/authorized_keys" do
  source "authorized_keys.erb"
  owner node.app.user
  group node.app.deploy_group
  mode "600"
end

directory node.app.user_home_path do
  owner node.app.user
  group node.app.deploy_group
  recursive true
  mode "750"
end

template "#{node.app.user_home_path}/.bash_aliases" do
  source "bash_aliases.erb"
  owner node.app.user
  group node.app.deploy_group
  mode "775"
end
