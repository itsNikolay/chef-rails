default['app']['app_name']    = 'testapp_production'
default['app']['app_stage']   = 'production'
default['app']['repo_url']    = 'git@github.com:itsNikolay/testapp.git'
default['app']['server']      = '192.168.33.10'
default['app']['apps_path']   = default['app']['user_home_path'] + '/apps'

default['app']['app_path']    = default['app']['apps_path'] + '/' + default['app']['app_name']
default['app']['app_current'] = default['app']['app_path']  + '/current'
default['app']['app_shared']  = default['app']['app_path']  + '/shared'
default['app']['app_public']  = default['app']['app_current'] + '/public'
default['app']['app_unicorn_bin']= default['app']['app_shared'] + "/bin/unicorn"
default['app']['app_unicorn_config']= default['app']['app_current'] + "/config/unicorn.rb"
default['app']['app_unicorn_sock']= default['app']['app_shared'] + "/tmp/sockets/unicorn.sock"
default['app']['app_unicorn_pid'] = default['app']['app_shared'] + '/tmp/pids/unicorn.pid'
default['app']['app_unicorn_pid_oldbin'] = default['app']['app_shared'] + '/tmp/pids/unicorn.pid.oldbin'
default['app']['app_unicorn_stderr'] = default['app']['app_current'] + '/log/unicorn_error.log'
default['app']['app_unicorn_stdlog'] = default['app']['app_current'] + '/log/unicorn.log'

default['app']['app_templates'] = default['app']['user_home_path'] + '/templates/' + default['app']['app_name']

