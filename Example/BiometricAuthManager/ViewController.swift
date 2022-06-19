//
//  ViewController.swift
//  BiometricAuthManager
//
//  Created by Den Seksan on 06/19/2022.
//  Copyright (c) 2022 Den Seksan. All rights reserved.
//

import BiometricAuthManager
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        print(BiometricAuthManager.biometricType())

        BiometricAuthManager.requestBiometric { [weak self] result in
            switch result {
            case .success:
                print("Successfully")

            case .failure(let errorType):
                switch errorType {
                case .authFailed:
                    print(errorType.message)
                case .cancelByUser:
                    print(errorType)
                case .cancelBySystem:
                    print(errorType)
                case .fallback:
                    print(errorType)
                case .passwordNotSet:
                    print(errorType)
                case .biometryNotAvailable:
                    print(errorType)
                case .biometryNotEnrolled:
                    print(errorType.message)
                case .biometryLockout:
                    print(errorType)
                case .other:
                    print(errorType)
                }
            }
        }
    }
}

