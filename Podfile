platform :ios, '10.0' 
use_frameworks! 
abstract_target 'Recipes' do
  pod 'Alamofire', '~> 4.0'
  pod 'ObjectMapper', '~> 2.2'
  pod 'RealmSwift'
  pod 'SwiftyJSON’, '~> 3.0'
  pod 'SDWebImage', '~> 3.8'
  pod 'ZoomTransitioning', '~> 1.4.0'
  target 'VNRecipes'
  target 'VNRecipes Dev'
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '3.0'
    end
  end
end
