require 'rake/docker_lib'

directory '.target/app'  => '.target' do 
  sh "git clone git@github.com/rchatley/extreme_startup.git .target/app"
end

Rake::DockerLib.new("tclavier/extreme-startup") do
  prepare do
     #sh "cd app/ && git pull"
  end
end

#task test: :build
task prepare: '.target/app'
