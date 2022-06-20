# BiometricAuthManager
Use Apple Biometric(FaceID or TouchID) in your application using BiometricAuthManager.
It's easy to use and handles Biometrics authentication based on the device.

[![Version](https://img.shields.io/cocoapods/v/BiometricAuthManager.svg?style=flat)](https://cocoapods.org/pods/BiometricAuthManager)
[![License](https://img.shields.io/cocoapods/l/BiometricAuthManager.svg?style=flat)](https://cocoapods.org/pods/BiometricAuthManager)
[![Platform](https://img.shields.io/cocoapods/p/BiometricAuthManager.svg?style=flat)](https://cocoapods.org/pods/BiometricAuthManager)

## Requirements

- iOS 11.0+
- Swift 5.0+

## Installation

**Note:** - Biometric(FaceID or TouchID) authentication requires user's persmission(Privacy - Face ID Usage Description) to be add in info.plist.
```swift
<key>NSFaceIDUsageDescription</key>
<string>This app requires Face ID permission to authenticate using Face recognition.</string>
```

BiometricAuthManager is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'BiometricAuthManager'
```

## License

BiometricAuthManager is available under the MIT license. See the LICENSE file for more info.
