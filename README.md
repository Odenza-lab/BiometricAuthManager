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

BiometricAuthManager is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'BiometricAuthManager'
```

**Note:** - Biometric(FaceID or TouchID) authentication requires user's persmission(Privacy - Face ID Usage Description) to be add in info.plist.
```swift
<key>NSFaceIDUsageDescription</key>
<string>This app requires Face ID permission to authenticate using Face recognition.</string>
```

## Usage

### import BiometricAuthManager

```swift
import BiometricAuthManager
```

### Get biometric type

```swift
BiometricAuthManager.biometricType()
```
 
### Authentication with biometric

```swift
BiometricAuthManager.requestBiometric { [weak self] result in
    switch result {
    case .success:
        print("Successfully")

    case .failure(let errorType):
        switch errorType {
        case .authFailed:
            print(errorType.message)
        case .cancelByUser:
            print(errorType.message)
        case .cancelBySystem:
            print(errorType.message)
        case .fallback:
            print(errorType.message)
        case .passwordNotSet:
            print(errorType.message)
        case .biometryNotAvailable:
            print(errorType.message)
        case .biometryNotEnrolled:
            print(errorType.message)
        case .biometryLockout:
            print(errorType.message)
        case .other:
            print(errorType.message)
        }
    }
}
```
### Error Handling

There are various cases of error that biometric authentication can be failed.

1. **authFailed**
    - Called when user failed to provide valid credentials.
2. **cancelByUser**
    - Called when authentication canceled by user.
3. **cancelBySystem**
    - Called when authentication canceled by system.
4. **fallback**
    - Called when user tapped the fallback button in the authentication dialog, but no fallback is available for the authentication policy.
5. **passwordNotSet**
    - Called when device passcode is not set.
6. **biometryNotAvailable**
    - Called when biometry is not available on the device.
7. **biometryNotEnrolled**
    - Called when no fingerprints or face is registered with the device.
8. **biometryLockout**
    - Called when biometry is locked because there were too many failed attempts.

## License

BiometricAuthManager is available under the MIT license. See the LICENSE file for more info.
