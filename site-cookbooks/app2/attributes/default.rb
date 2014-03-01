default['app']['apps_path']   = '/u/apps'

default['app']['app_name']    = 'testapp_production'
default['app']['app_path']    = default['app']['apps_path'] + '/' + default['app']['app_name']
default['app']['app_current'] = default['app']['app_path']  + '/current'
default['app']['app_shared']  = default['app']['app_path']  + '/shared'
default['app']['app_public']  = default['app']['app_current'] + '/public'
default['app']['app_stage']   = 'production'
default['app']['repo_url']    = 'git@github.com:itsNikolay/testapp.git'
default['app']['server']      = '192.168.33.10'
default['app']['user']        = 'app'
default['app']['app_unicorn_sock']= default['app']['app_shared'] + "/unicorn.sock"
default['app']['app_unicorn_pid'] = default['app']['app_shared'] + '/pids/unicorn.pid'
default['app']['app_unicorn_pid_oldbin'] = default['app']['app_shared'] + '/pids/unicorn.pid.oldbin'
