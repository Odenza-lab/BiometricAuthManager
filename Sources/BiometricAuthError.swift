//
//  BiometricAuthError.swift
//  BiometricAuthManager
//
//  Created by Den Seksan on 19/6/2565 BE.
//

import Foundation
import LocalAuthentication

public enum AuthenticationError: Error {
    case authFailed
    case cancelByUser
    case cancelBySystem
    case fallback
    case passwordNotSet
    case biometryNotAvailable
    case biometryNotEnrolled
    case biometryLockout
    case other

    public static func authError(_ error: LAError) -> AuthenticationError {
        switch Int32(error.errorCode) {
        case kLAErrorAuthenticationFailed:
            return authFailed
        case kLAErrorUserCancel:
            return cancelByUser
        case kLAErrorSystemCancel:
            return cancelBySystem
        case kLAErrorUserFallback:
            return fallback
        case kLAErrorPasscodeNotSet:
            return passwordNotSet
        case kLAErrorBiometryNotAvailable:
            return biometryNotAvailable
        case kLAErrorBiometryNotEnrolled:
            return biometryNotEnrolled
        case kLAErrorBiometryLockout:
            return biometryLockout
        default:
            return other
        }
    }

    // get error message
    public var message: String {
        let isFaceID = BiometricAuthManager.biometricType() == .faceID

        switch self {
        case .cancelByUser, .cancelBySystem, .fallback:
            return ""

        case .passwordNotSet:
            return isFaceID ? setPasscodeToUseFaceID : setPasscodeToUseTouchID

        case .biometryNotAvailable:
            return biometryNotAvailableReason

        case .biometryNotEnrolled:
            return isFaceID ? faceIdNotEnrolled : touchIdNotEnrolled

        case .biometryLockout:
            return isFaceID ? faceIdLockout : touchIdLockout

        default:
            return isFaceID ? faceIdAuthenticationFailed : touchIdAuthenticationFailed
        }
    }
}
