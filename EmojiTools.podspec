Pod::Spec.new do |s|
  s.platform = :ios
  s.ios.deployment_target = '8.0'
  s.name         = "EmojiTools"
  s.version      = "1.0.2"
  s.summary      = "Framework for detecting emoji and using emoji shortcut codes."
  s.requires_arc = true
  s.homepage     = "https://github.com/toddkramer/EmojiTools"
  s.license      = { :type => "MIT", :file => "LICENSE.txt" }
  s.author             = "Todd Kramer"
  s.source       = { :git => "https://github.com/toddkramer/EmojiTools.git", :tag => "#{s.version}" }
  s.source_files  = "EmojiTools/**/*.{swift}"
end
