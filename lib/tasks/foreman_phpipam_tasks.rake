require 'rake/testtask'

# Tasks
namespace :foreman_phpipam do
  namespace :example do
    desc 'Example Task'
    task task: :environment do
      # Task goes here
    end
  end
end

# Tests
namespace :test do
  desc 'Test ForemanPhpipam'
  Rake::TestTask.new(:foreman_phpipam) do |t|
    test_dir = File.join(File.dirname(__FILE__), '../..', 'test')
    t.libs << ['test', test_dir]
    t.pattern = "#{test_dir}/**/*_test.rb"
    t.verbose = true
    t.warning = false
  end
end

namespace :foreman_phpipam do
  task :rubocop do
    begin
      require 'rubocop/rake_task'
      RuboCop::RakeTask.new(:rubocop_foreman_phpipam) do |task|
        task.patterns = ["#{ForemanPhpipam::Engine.root}/app/**/*.rb",
                         "#{ForemanPhpipam::Engine.root}/lib/**/*.rb",
                         "#{ForemanPhpipam::Engine.root}/test/**/*.rb"]
      end
    rescue
      puts 'Rubocop not loaded.'
    end

    Rake::Task['rubocop_foreman_phpipam'].invoke
  end
end

Rake::Task[:test].enhance ['test:foreman_phpipam']

load 'tasks/jenkins.rake'
if Rake::Task.task_defined?(:'jenkins:unit')
  Rake::Task['jenkins:unit'].enhance ['test:foreman_phpipam', 'foreman_phpipam:rubocop']
end
