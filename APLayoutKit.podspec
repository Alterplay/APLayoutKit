#
# Be sure to run `pod lib lint APLayoutKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'APLayoutKit'
  s.version          = '0.4.4'
  s.summary          = 'Build layout in code using UIKit and check in SwiftUI preview'
  s.description      = <<-DESC
Build your UIKIt layout in code using APLayoutKit and examine it in SwiftUI Preview
                       DESC

  s.homepage         = 'https://github.com/Alterplay/APLayoutKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'vladislavsosiuk' => 'v.sosiuk@alterplay.com' }
  s.source           = { :git => 'https://github.com/Alterplay/APLayoutKit.git', :tag => s.version.to_s }

  s.ios.deployment_target = '11.0'

  s.source_files = 'APLayoutKit/Classes/**/*'
  s.frameworks = 'UIKit'
  s.swift_versions = '5.0'
end
