Pod::Spec.new do |s|
  s.name         = "CZRefreshView"
  s.version      = "0.0.1"
  s.summary      = "iOS-状态视图容器"
  s.description  = "iOS-状态视图容器类"
  s.homepage     = "https://github.com/chenzhe555/iOS-CZRefreshView"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "chenzhe555" => "376811578@qq.com" }
  s.ios.deployment_target = "9.0"
  s.source       = { :git => "https://github.com/chenzhe555/iOS-CZRefreshView.git", :tag => "#{s.version}" }
  s.subspec 'CZRefreshView' do |one|
      one.source_files = 'CZRefreshView/classes/*.{h,m}'
  end
  s.resources = ["CZRefreshView/classes/CZRefreshViewResource.bundle"]
  # s.frameworks = "SomeFramework", "AnotherFramework"
  # s.libraries = "iconv", "xml2"
  s.requires_arc = true
  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "SDWebImage", "~> 5.0.0-beta3"
end
