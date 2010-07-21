set :application, "freysmiles"
set :repository,  "git@github.com:anuragsolanki/Dummy-App.git"

set :deploy_to, "/var/www/#{application}"
set :keep_releases, 5

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
set :scm, :git
set :branch, 'master'
set :user, 'deploy'
set :use_sudo, false
default_run_options[:pty] = true
ssh_options[:forward_agent] = true
set :deploy_via, :remote_cache
set :git_shallow_clone, 1
set :git_enable_submodules, 1

role :app, "173.230.139.42"
role :web, "173.230.139.42"
role :db, "173.230.139.42", :primary => true


namespace :deploy do
 desc "Restarting mod_rails with restart.txt"
 task :restart, :roles => :app, :except => { :no_release => true } do
   run "touch #{current_path}/tmp/restart.txt"
 end

 [:start, :stop].each do |t|
   desc "#{t} task is a no-op with mod_rails"
   task t, :roles => :app do ; end
 end
 
 task :after_symlink, :roles => :app do
   run "cp #{shared_path}/database.yml #{current_path}/config/database.yml"
 end
 
 desc "Deploy with migrations"
 task :long do
   transaction do
     update_code
     web.disable
     symlink
     migrate
   end

   restart
   web.enable
   cleanup
 end

 

end
