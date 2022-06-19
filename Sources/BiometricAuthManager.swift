//
//  BiometricAuthManager.swift
//  BiometricAuthManager
//
//  Created by Den Seksan on 19/6/2565 BE.
//

import Foundation
import LocalAuthentication

open class BiometricAuthManager: NSObject {

    public static let shared = BiometricAuthManager()

    private override init() {}

    public var allowableReuseDuration: TimeInterval = 0

    public enum BiometricType {
        case none
        case faceID
        case touchID
    }

    /// check biometric is available
    public var isBiometricAvailable: Bool {
        let context = LAContext()
        var error: NSError? = nil
        let canEvaluate = context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error)
        return canEvaluate
    }

    /// check biometric type
    public class func biometricType() -> BiometricType {
        let context = LAContext()
        var error: NSError?
        let _ = context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error)
        switch context.biometryType {
        case .none:
            return .none
        case .faceID:
            return .faceID
        case .touchID:
            return .touchID
        @unknown default:
            return .none
        }
    }

    /// request biometric authentication
    public class func requestBiometric(
        reason: String? = nil,
        fallbackTitle: String? = "",
        cancelTitle: String? = "",
        completion: @escaping (Result<Bool, AuthenticationError>) -> Void
    ) {
        let context = LAContext()
        var authError: NSError?
        var localizedReason: String

        if let reason = reason {
            localizedReason = reason
        } else {
            localizedReason = BiometricAuthManager.shared.defaultBiometricAuthenticationReason()
        }

        context.touchIDAuthenticationAllowableReuseDuration = BiometricAuthManager.shared.allowableReuseDuration
        context.localizedCancelTitle = cancelTitle
        context.localizedFallbackTitle = fallbackTitle

        let canEvaluate = context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &authError)

        if canEvaluate {
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: localizedReason) { isSuccess, error in
                DispatchQueue.main.async {
                    if isSuccess {
                        completion(.success(true))
                    } else {
                        let errorType = AuthenticationError.authError(error as! LAError)
                        completion(.failure(errorType))
                    }
                }
            }
        } else {
            let errorType = AuthenticationError.authError(authError as! LAError)
            completion(.failure(errorType))
        }
    }

    private func defaultBiometricAuthenticationReason() -> String {
        let isFaceID = BiometricAuthManager.biometricType() == .faceID
        return isFaceID ? defaultFaceIdReason : defaultTouchIdReason
    }
}
