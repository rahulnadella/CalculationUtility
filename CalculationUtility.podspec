Pod::Spec.new do |spec|
  spec.name         = 'CalculationUtility'
  spec.version      = '1.1.0'
  spec.license      = { :type => 'MIT' }
  spec.homepage     = 'https://github.com/rahulnadella/CalculationUtility'
  spec.authors      = { 'Rahul Nadella' => 'rahulnadella@yahoo.com' }
  spec.summary      = 'Utility that provides explicit overloaded calculation functions'
  spec.source       = { :git => 'https://github.com/rahulnadella/CalculationUtility.git', :tag => 'v1.1.0' }
  spec.source_files = 'src'
  spec.framework    = 'UIKit, Foundation, CoreGraphics'
end
