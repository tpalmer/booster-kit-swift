# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'BoosterKit' do

  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for BoosterKit
  pod 'RealmSwift'
  pod 'BuddyBuildSDK'
  pod 'Alamofire'
  pod 'AlamofireObjectMapper'
  pod 'SwiftLint'
  pod 'SwiftyBeaver'
  pod 'KeychainAccess'

  target 'BoosterKitTests' do
    inherit! :search_paths
    # Pods for testing

    pod 'Quick'
    pod 'Nimble'
    pod 'Nocilla', git: 'git@github.com:pcantrell/Nocilla.git', branch: 'null-annotations'
    pod 'SwiftyMocky'
  end

  target 'BoosterKitFeatures' do
    inherit! :search_paths
    # Pods for UI testing

    pod 'KIF'
  end
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '4.0'
    end
  end
end
