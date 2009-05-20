require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "postcode"
    gem.summary = %Q{TODO}
    gem.email = "ben.schwarz@gmail.com"
    gem.homepage = "http://github.com/benschwarz/postcode"
    gem.authors = ["Ben Schwarz"]

    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/*_test.rb'
  test.verbose = false
end

begin
  require 'rcov/rcovtask'
  Rcov::RcovTask.new do |test|
    test.libs << 'test'
    test.pattern = 'test/**/*_test.rb'
    test.verbose = true
  end
rescue LoadError
  task :rcov do
    abort "RCov is not available. In order to run rcov, you must: sudo gem install spicycode-rcov"
  end
end

begin
  require 'cucumber/rake/task'
  Cucumber::Rake::Task.new(:features)
rescue LoadError
  task :features do
    abort "Cucumber is not available. In order to run features, you must: sudo gem install cucumber"
  end
end

task :default => :test

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  if File.exist?('VERSION.yml')
    config = YAML.load(File.read('VERSION.yml'))
    version = "#{config[:major]}.#{config[:minor]}.#{config[:patch]}"
  else
    version = ""
  end

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "postcode #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

task :environment do
  require 'lib/postcode'
end

namespace :db do
  task :import => :environment do
    gem 'fastercsv'
    require 'fastercsv'
    
    DataMapper.auto_migrate!
    
    postcodes = FasterCSV.read(File.join(File.dirname(__FILE__), "db", "pc-full_20090428.csv"))
    postcodes.each do |(post_code, name, state_name, _, _, _, _, _, _, category)|
      post_code = sprintf("%04d", post_code.to_i)
      state = Postcode::State.first_or_create(:abbreviation => state_name)
      Postcode::Locality.create(:post_code => post_code, :name => name, :state => state)
    end
  end
end
