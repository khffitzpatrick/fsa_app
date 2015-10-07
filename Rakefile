require 'rspec/core/rake_task'

namespace :test do

	desc 'Run all the tests and print out documentation'
	task :all => [:rspec, :rspec_nyan]

	desc 'Run Rspec tests with documentation'
	RSpec::Core::RakeTask.new(:rspec) do |t|
		t.rspec_opts = '--format documentation'
	end
	
	desc 'Run Rspec tests with NyanCat'	
	RSpec::Core::RakeTask.new(:rspec_nyan) do |t|
		t.rspec_opts = '--format NyanCatFormatter'
	end

end

task :default => 'test:all'