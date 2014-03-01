package 'htop'


case node['platform_family']
when 'rhel'
  package 'ImageMagick'
when 'debian', 'mac_os_x'
  package 'imagemagick'
end

template "/etc/nginx/sites-enabled/default" do
  source "nginx.erb"
  mode "0644"
end

include_recipe 'runit::default'

runit_service 'testapp-unicorn'

service 'testapp-unicorn' do
  reload_command "#{node['runit']['sv_bin']} hup #{node['runit']['service_dir']}/testapp-unicorn"
end

directory '/etc/service' do
  owner 'vagrant'
  group 'admin'
  recursive true
end

directory '/etc/sv' do
  owner 'vagrant'
  group 'admin'
  recursive true
end


