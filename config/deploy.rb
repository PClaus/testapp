set :application, 'testapp'
set :rails_env, :production
set :deploy_to, "/kunden/300699_12437/webseiten/#{application}_staging"

set :use_sudo, false

default_run_options[:pty] = true
set :scm, :git
set :git_enable_submodules, 1

set :scm_passphrase, "M!pete0324"
set :user, "PClaus"

# use local copy
# set :deploy_via, :copy       
#set :deploy_via, :remote_cache         
set :copy_strategy, :export
set :copy_compression, :zip
set :copy_cache, true
set :copy_exclude, ['.git']
set :repository, "git@github.com:PClaus/#{application}.git"

role :app, 'active-dating.eu'
role :web, 'active-dating.eu'
role :db,  'active-dating.eu', :primary => true

set :user, 'ssh-300699-pclaus'
ssh_options[:port] = '22'
#set :ssh_options, { :forward_agent => true }

# Restart mod_rails
#namespace :deploy do
# task :restart, :roles => :app do             
#    run "touch #{current_release}/tmp/restart.txt"
#  end
#end