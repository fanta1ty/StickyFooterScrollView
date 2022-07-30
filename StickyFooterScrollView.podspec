#
# Be sure to run `pod lib lint StickyFooterScrollView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'StickyFooterScrollView'
  s.version          = '0.1.0'
  s.summary          = 'StickyFooterScrollView is a simple and flexible UI component fully written in Swift.'
  
  s.description      = 'StickyFooterScrollView is developed for quick creation of UIScrollView to implement.\nUsually when creating UIScrollView, developers have to declare and adjust many complex UI constraints to use, StickyFooterScrollView was developed to solve the above problem.\n StickyFooterScrollView focuses on quick initialization of UIScrollView and its ease of use with a few declared simple functions'

  s.homepage         = 'https://github.com/fanta1ty/StickyFooterScrollView'
  s.screenshots     = 'https://github.com/fanta1ty/StickyFooterScrollView/blob/master/StickyFooterScrollView/Assets/Screenshot.png?raw=true'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'fanta1ty' => 'thinhnguyen12389@gmail.com' }
  s.source           = { :git => 'https://github.com/fanta1ty/StickyFooterScrollView.git', :tag => s.version.to_s }

  s.ios.deployment_target = '11.0'

  s.source_files = 'StickyFooterScrollView/Classes/**/*'
  s.swift_version = '5.0'
  
  # s.resource_bundles = {
  #   'StickyFooterScrollView' => ['StickyFooterScrollView/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
