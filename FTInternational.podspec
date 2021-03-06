#
#  Be sure to run `pod spec lint FTInternational.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = 'FTInternational'
  s.version      = '0.0.4'
  s.summary      = 'App International'

  s.description  = <<-DESC
  App International 支持swift 4.0
                   DESC

  s.homepage     = 'https://github.com/wenxp/FTInternational'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author             = { 'wenxp' => 'wenxp2006@gmail.com' }
  s.ios.deployment_target = '8.0'

  s.source       = { :git => "https://github.com/wenxp/FTInternational.git", :tag => s.version.to_s }

  s.default_subspec = 'Core'

  s.subspec 'Core' do |core|
      core.ios.deployment_target = '8.0'
      core.source_files = 'Source/*.swift'
  end

end
