# Rakefile for 3in1-auth gem

require 'rake'
require 'rake/testtask'
require 'bundler/gem_tasks'

# Define a task to run tests
Rake::TestTask.new do |t|
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
end

# Define a task to build the gem
task :build do
  sh 'gem build three_in_one_auth.gemspec'
end

# Define a task to install the gem
task install: :build do
  sh 'gem install three_in_one_auth-*.gem'
end

# Define a task to clean up generated files
task :clean do
  rm_rf Dir.glob('*.gem')
end

# Define the default task
task default: %i[build test]
