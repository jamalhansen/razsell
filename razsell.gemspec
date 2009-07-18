# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{razsell}
  s.version = "0.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jamal Hansen"]
  s.date = %q{2009-07-18}
  s.email = %q{jamal.hansen@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "docs/RSSGuide1.02.pdf",
     "features/razsell.feature",
     "features/step_definitions/razsell_steps.rb",
     "features/support/env.rb",
     "features/support/razsell_mixed_in.rb",
     "lib/constants.rb",
     "lib/constants/image_sizes.rb",
     "lib/constants/product_types.rb",
     "lib/constants/sort_methods.rb",
     "lib/constants/sort_periods.rb",
     "lib/engine.rb",
     "lib/http_service.rb",
     "lib/item.rb",
     "lib/query.rb",
     "lib/razsell.rb",
     "lib/results.rb",
     "razsell.gemspec",
     "test/engine_test.rb",
     "test/fixtures.rb",
     "test/fixtures/page_1.rss",
     "test/fixtures/page_2.rss",
     "test/fixtures/rockstar.rss",
     "test/product_types_test.rb",
     "test/query_test.rb",
     "test/razsell_test.rb",
     "test/results_test.rb",
     "test/test_helper.rb"
  ]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/rubyyot/razsell}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{A gem for getting info about products on a website that has a similar name}
  s.test_files = [
    "test/engine_test.rb",
     "test/fixtures.rb",
     "test/results_test.rb",
     "test/test_helper.rb",
     "test/product_types_test.rb",
     "test/razsell_test.rb",
     "test/query_test.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<hpricot>, [">= 0.8.1"])
      s.add_development_dependency(%q<cucumber>, [">= 0.3.11"])
      s.add_development_dependency(%q<mocha>, [">= 0"])
      s.add_development_dependency(%q<technicalpickles-shoulda>, [">= 0"])
    else
      s.add_dependency(%q<hpricot>, [">= 0.8.1"])
      s.add_dependency(%q<cucumber>, [">= 0.3.11"])
      s.add_dependency(%q<mocha>, [">= 0"])
      s.add_dependency(%q<technicalpickles-shoulda>, [">= 0"])
    end
  else
    s.add_dependency(%q<hpricot>, [">= 0.8.1"])
    s.add_dependency(%q<cucumber>, [">= 0.3.11"])
    s.add_dependency(%q<mocha>, [">= 0"])
    s.add_dependency(%q<technicalpickles-shoulda>, [">= 0"])
  end
end
