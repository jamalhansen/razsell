require 'rubygems'
require 'rake'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'lib'))
require 'razsell'
include Razsell

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "razsell"
    gem.summary = %Q{A gem for getting info about products on a website that has a similar name}
    gem.description = %Q{Queries Zazzle RSS feed for data.}
    gem.email = "jamal.hansen@gmail.com"
    gem.homepage = "http://github.com/rubyyot/razsell"
    gem.authors = ["Jamal Hansen"]
    gem.add_dependency('hpricot', '>= 0.8.1')
    gem.add_development_dependency('cucumber', '>= 0.3.11')
    gem.add_development_dependency('mocha')
    gem.add_development_dependency('shoulda')
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end

rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: sudo gem install jeweler"
end

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/*_test.rb'
  test.verbose = true
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
  rdoc.title = "razsell #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

namespace :products do
  desc "Returns a list of products for an artist"
  task :for, :artist do |t, args|
    abort "Please pass a data_root path like: rake products:for['my_login']" unless args[:artist]

    results = products_for args[:artist]
    results.items.sort {|x,y| x.title <=> y.title }.each { |p| puts p.title }
  end
end
