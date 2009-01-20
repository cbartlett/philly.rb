set :default_env,  'beta'
set :rails_env,     ENV['rails_env'] || ENV['RAILS_ENV'] || default_env
set :extra_deploys, 'config/deployments/'

role :app, "nolan.kineticweb.com"
role :web, "nolan.kineticweb.com"
role :db, "nolan.kineticweb.com", :primary => true

set :scm, :git
set :user, 'phillyonrails'
set :application, "phillyonrails"
set :repository,  "git@github.com:cbartlett/philly.rb.git"

set :deploy_via, :remote_cache
ssh_options[:forward_agent] = true

namespace :deploy do
  desc "Restarting mod_rails with restart.txt"
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{current_path}/tmp/restart.txt"
  end

  [:start, :stop].each do |t|
    desc "#{t} task is a no-op with mod_rails"
    task t, :roles => :app do ; end
  end
end


if extra_deploys && File.exists?(extra_deploys+rails_env+".rb")
  puts "Loaded #{extra_deploys+rails_env}.rb" if load extra_deploys+rails_env
else
  puts "Could not find #{extra_deploys+rails_env}.rb"
end