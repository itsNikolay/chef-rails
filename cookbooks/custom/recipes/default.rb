template "/etc/monit/conf.d/nginx.conf" do
  source "nginx.conf.erb"
  mode "770"
end

template "/etc/monit/conf.d/postgresql.conf" do
  source "postgresql.conf.erb"
  mode "770"
end

template "/etc/monit/conf.d/redis.conf" do
  source "redis.conf.erb"
  mode "770"
end

service "monit" do
  action :reload
end
