Pod::Spec.new do |s|
  s.name             = "CBuilder"
  s.version          = "0.2.0"
  s.summary          = "A Swift Autolayout DSL for iOS"
  s.description      = <<-DESC
Super sweet syntactic sugar for Constraints in UIKit.
A Swift Autolayout DSL for iOS
                        DESC
  s.homepage         = "https://github.com/ViniciusDeep/CBuilder"
  s.license          = 'MIT'
  s.author           = { "Vinicius Mangueira " => "email-here" }
  s.source           = { :git => "https://github.com/ViniciusDeep/CBuilder.git", :tag => s.version.to_s }

  s.requires_arc          = true

  s.ios.deployment_target = '9.0'

  s.source_files          = 'CBuilder/Source/**/*.swift'
  s.swift_version = '5.0'
  
  s.test_spec 'Tests' do |test_spec|
    test_spec.source_files = 'CBuilderTests/**/*.swift'
  end

end

