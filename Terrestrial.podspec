#
# Be sure to run `pod lib lint Terrestrial.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "Terrestrial"
  s.version          = "0.2.19"
  s.summary          = "Translate an entire app with just 3 commands"

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  


s.description      = <<-DESC
This cocoapod allows you to quickly get your app localized.
                       DESC

  s.homepage         = "https://terrestrial.io"
  s.license          = 'MIT'
  s.author           = { "Joe" => "joe@terrestrial.io" }
  s.source           = { :git => "https://github.com/terrestrial-io/iOSFrameworkRepo.git", :tag => s.version.to_s }

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.public_header_files = 'Terrestrial/*.{h}'

  s.source_files = 'Terrestrial/*.{h,m}'
  s.ios.vendored_frameworks = "Frameworks/TerrestrialPhotoshoot.framework"



end
