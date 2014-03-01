case node['platform_family']
when 'rhel'
  package 'ImageMagick'
when 'debian', 'mac_os_x'
  package 'imagemagick'
  package 'htop'
end

file "/etc/nginx/sites-enabled/default" do
  action :delete
end

template "/etc/nginx/sites-enabled/#{node.app.app_name}" do
  source "nginx.erb"
  mode "0644"
end

group 'admin' do
  gid 420
end

include_recipe 'runit::default'

runit_service node.app.app_name do
  group 'admin'
  run_template_name "runit_unicorn"
  log_template_name "runit_unicorn_log"
end

service node.app.app_name do
  reload_command "#{node['runit']['sv_bin']} hup #{node['runit']['service_dir']}/#{node.app.app_name}"
end

user node.app.user do
  password '12345678'
  gid 'admin'
  home "/home/#{node.app.user}"
  shell '/bin/bash'
  supports :manage_home => true
end

(%w(/u /etc/service /etc/sv) << node.app.apps_path).each do |path|
  directory path do
    owner node.app.user
    group 'admin'
    recursive true
  end
end
