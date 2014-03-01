case node['platform_family']
when 'rhel'
  package 'ImageMagick'
when 'debian', 'mac_os_x'
  package 'imagemagick'
  package 'htop'
end

template "/etc/nginx/sites-enabled/#{node.app.app_name}" do
  source "nginx.erb"
  mode "0644"
end


directories = [node.app.apps_path, node.app.app_templates]

directories.each do |dir|
  directory dir do
    owner node.app.user
    group node.app.deploy_group
    recursive true
    action :create
    mode "770"
  end
end

app_files = %w(unicorn.rb database.yml deploy.rb Gemfile production.rb Capfile)
app_files.each do |file|
  template node.app.app_templates + "/#{file}" do
    source file + ".erb"
    owner node.app.user
    group node.app.deploy_group
    mode 0644
  end
end

template node.app.user_home_path + '/.gemrc' do
  source "gemrc.erb"
  mode "644"
end

template "/etc/init.d/#{node.app.app_name}" do
  source "init.erb"
  group node.app.deploy_group
  mode "770"
end

group node.app.deploy_group do
  gid 420
  members ["root", "www-data", "redis", node.app.user]
end

template "/etc/monit/conf.d/#{node.app.app_name}.conf" do
  source "init.conf.erb"
  mode "770"
end
