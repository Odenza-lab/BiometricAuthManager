//
//  BiometricAuthConstant.swift
//  BiometricAuthManager
//
//  Created by Den Seksan on 19/6/2565 BE.
//

import Foundation

let biometryNotAvailableReason = "Biometric authentication is not available."

/// error message for Face ID
let defaultFaceIdReason = "Confirm your face to authenticate."
let faceIdNotEnrolled = "There is no face enrolled in the device. Please go to Device Settings -> Face ID & Passcode and enroll your face."
let setPasscodeToUseFaceID = "Please set device passcode to use Face ID for authentication."
let faceIdLockout = "Too many failed attempts. Enter passcode to unlock Face ID."
let faceIdAuthenticationFailed = "Face ID does not recognize your face. Please try again with your enrolled face."

/// error message for Touch ID
let defaultTouchIdReason = "Confirm your fingerprint to authenticate."
let touchIdNotEnrolled = "There are no fingerprints enrolled in the device. Please go to Device Settings -> Touch ID & Passcode and enroll your fingerprints."
let setPasscodeToUseTouchID = "Please set device passcode to use Touch ID for authentication."
let touchIdLockout = "Touch ID is locked now, because of too many failed attempts. Enter passcode to unlock Touch ID."
let touchIdAuthenticationFailed = "Touch ID does not recognize your fingerprint. Please try again with your enrolled fingerprint."
