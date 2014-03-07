#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Zenzai::Application.load_tasks

unless ENV['DYNO'] # Running on Heroku
  task :build => %w{db:migrate db:test:prepare spec cucumber}

  Rake::Task["default"].clear if Rake::Task.task_defined?("default")
  task :default => :build
end
