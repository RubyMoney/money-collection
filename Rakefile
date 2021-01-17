require "bundler/gem_tasks"

task :default => :test

require 'rake/testtask'
Rake::TestTask.new do |t|
  t.libs.push "lib"
  t.libs.push "spec"
  t.test_files = FileList['spec/**/*_spec.rb']
  t.verbose = true
end
