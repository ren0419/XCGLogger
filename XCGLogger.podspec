Pod::Spec.new do |spec|

    spec.name = 'XCGLogger'
    spec.version = '7.1.1'
    spec.summary = 'A debug log module for use in Swift projects.'

    spec.description = <<-DESC
                        Allows you to log details to the console (and optionally a file), just like you would have with NSLog() or print(), but with additional information, such as the date, function name, filename and line number.
                        DESC

    spec.homepage = 'https://github.com/DaveWoodCom/XCGLogger'

    spec.license = { :type => 'MIT', :file => 'LICENSE.txt' }
    spec.author = { 'Dave Wood' => 'cocoapods@cerebralgardens.com' }
    spec.social_media_url = 'https://mastodon.social/@davewoodx'
    spec.platforms = { :ios => '15.0', :watchos => '9.0', :tvos => '15.0' }
    spec.requires_arc = true
    spec.pod_target_xcconfig = { 'SWIFT_VERSION' => '5.0' }
    spec.swift_version = '5.0'

    spec.source = { :git => 'https://github.com/DaveWoodCom/XCGLogger.git', :tag => "#{spec.version}" }

    spec.ios.deployment_target = '15.0'
    spec.osx.deployment_target = '13.0'
    spec.watchos.deployment_target = '9.0'
    spec.tvos.deployment_target = '15.0'

    spec.default_subspecs = 'Core'

    # Main XCGLogger Framework
    spec.subspec 'Core' do |core|
        core.dependency 'ObjcExceptionBridging'
        core.source_files = 'Sources/XCGLogger/**/*.{swift}'
        core.exclude_files = 'Sources/XCGLogger/**/Optional/*.{swift}'
        core.resource = '.swift-version', 'Sources/XCGLogger/PrivacyInfo.xcprivacy'
    end

    # An experimental subspec to include helpers for using the UserInfo dictionary with log messages, tagging logs with tags and/or developers
    spec.subspec 'UserInfoHelpers' do |userinfohelpers|
        userinfohelpers.dependency 'XCGLogger/Core'
        userinfohelpers.source_files = 'Sources/XCGLogger/Misc/Optional/UserInfoHelpers.swift'
    end
end
