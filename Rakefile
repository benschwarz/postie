require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "postie"
    gem.summary = %Q{A Sinatra based Rack middleware for Australian postcodes}
    gem.email = "ben.schwarz@gmail.com"
    gem.homepage = "http://github.com/benschwarz/postie"
    gem.authors = ["Ben Schwarz"]
    gem.add_dependency("sinatra", ">= 0.9.2")
    gem.add_dependency("dm-core", ">= 0.9.8")
    gem.add_dependency("dm-serializer", ">= 0.9.8")
    gem.add_dependency("json")

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
  require 'lib/postie'
end

namespace :db do
  task :import => :environment do
    gem 'fastercsv'
    require 'fastercsv'
    
    DataMapper.auto_migrate!
    
    postcodes = FasterCSV.read(File.join(File.dirname(__FILE__), "db", "pc-full_20090428.csv"))
    postcodes.each do |(post_code, name, state_name, comments, _, _, _, _, _, category)|
      post_code = sprintf("%04d", post_code.to_i)
      state = Postie::State.first_or_create(:abbreviation => state_name)
      Postie::Locality.create(:post_code => post_code, :name => name, :state => state, :comments => comments)
    end
  end
end
