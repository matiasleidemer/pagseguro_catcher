# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "pagseguro_catcher"
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Matias H. Leidemer"]
  s.date = "2011-10-31"
  s.description = "This gem provides a simple way to check and parse the PagSeguro transaction notification."
  s.email = "matiasleidemer@gmail.com"
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.textile"
  ]
  s.files = [
    ".document",
    ".rspec",
    ".travis.yml",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.textile",
    "Rakefile",
    "VERSION",
    "lib/pagseguro_catcher.rb",
    "lib/pagseguro_catcher/checker.rb",
    "lib/pagseguro_catcher/constants.rb",
    "lib/pagseguro_catcher/core_ext/Hash.rb",
    "lib/pagseguro_catcher/core_ext/string.rb",
    "lib/pagseguro_catcher/transaction.rb",
    "lib/pagseguro_catcher/transaction/amount.rb",
    "lib/pagseguro_catcher/transaction/base.rb",
    "lib/pagseguro_catcher/transaction/item.rb",
    "lib/pagseguro_catcher/transaction/sender.rb",
    "lib/pagseguro_catcher/transaction/shipping.rb",
    "pagseguro_catcher.gemspec",
    "spec/checker_spec.rb",
    "spec/pagseguro_catcher_spec.rb",
    "spec/spec_helper.rb",
    "spec/support/return.xml",
    "spec/transaction/amount_spec.rb",
    "spec/transaction/base_spec.rb",
    "spec/transaction/item_spec.rb",
    "spec/transaction/sender_spec.rb",
    "spec/transaction/shipping_spec.rb"
  ]
  s.homepage = "http://github.com/matiasleidemer/pagseguro_catcher"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.11"
  s.summary = "A simple gem to parse PagSeguro transaction notification."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<httparty>, [">= 0"])
      s.add_runtime_dependency(%q<activesupport>, [">= 0"])
      s.add_runtime_dependency(%q<i18n>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["~> 2.3.0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.6.4"])
      s.add_development_dependency(%q<rcov>, [">= 0"])
      s.add_development_dependency(%q<fakeweb>, [">= 0"])
    else
      s.add_dependency(%q<httparty>, [">= 0"])
      s.add_dependency(%q<activesupport>, [">= 0"])
      s.add_dependency(%q<i18n>, [">= 0"])
      s.add_dependency(%q<rspec>, ["~> 2.3.0"])
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.6.4"])
      s.add_dependency(%q<rcov>, [">= 0"])
      s.add_dependency(%q<fakeweb>, [">= 0"])
    end
  else
    s.add_dependency(%q<httparty>, [">= 0"])
    s.add_dependency(%q<activesupport>, [">= 0"])
    s.add_dependency(%q<i18n>, [">= 0"])
    s.add_dependency(%q<rspec>, ["~> 2.3.0"])
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.6.4"])
    s.add_dependency(%q<rcov>, [">= 0"])
    s.add_dependency(%q<fakeweb>, [">= 0"])
  end
end

