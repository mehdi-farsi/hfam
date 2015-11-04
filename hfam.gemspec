# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hfam'

Gem::Specification.new do |spec|
  spec.name          = "hfam"
  spec.version       = HFAM::VERSION
  spec.authors       = ["mehdi_farsi"]
  spec.date          = Time.now.strftime("%F")
  spec.email         = ["mehdifarsi.pro@gmail.com"]

  spec.summary       = %q{Hidden Files Are Manageable}
  spec.description   = %q{Manage and reload you dotfiles in a centralized directory}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = %w{lib/hfam.rb lib/hfam/version.rb lib/hfam/argument_parser.rb}
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  
  spec.require_paths = ["lib"]
  spec.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  

  spec.required_ruby_version = '>= 1.9.3'
  spec.post_install_message = <<-EOF
  Thanks for installing!
  
  You can follow me on:
    - Twitter: @farsi_mehdi
    - Github: mehdi-farsi
  
  This project permits to help to solve a common problem. My reward is to see you using it.
  
  So please, feel free to 'star' the project on GitHub:
  
  https://github.com/mehdi-farsi/activerecord-search
  
   Many Thanks !
  EOF


  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end