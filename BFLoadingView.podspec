Pod::Spec.new do |s|
  s.name             = 'BFLoadingView'
  s.version          = '1.0.1'
  s.summary          = 'BFLoadingView is the new morphing polygonal activity indicator'

  s.description      = <<-DESC
  Use BFLoadingView as an activity indicator or progress HUD for your application. It can be used in any UIViewController when something is done in the background and the user has to wait for it.
                       DESC

  s.homepage         = 'https://www.bitfactory.io'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Matthias Nagel' => 'matthias@bitfactory.io' }
  s.source           = { :git => 'https://github.com/bitfactoryio/BFLoadingView.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/bitfactoryio'
  s.swift_version = '5.1'

  s.ios.deployment_target = '11.0'

  s.source_files = 'BFLoadingView/Classes/**/*'
  
end
