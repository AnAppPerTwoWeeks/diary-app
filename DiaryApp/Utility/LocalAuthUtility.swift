//
//  LocalAuthUtility.swift
//  DiaryApp
//
//  Created by 장창순 on 22/03/2020.
//  Copyright © 2020 AnAppPerTwoWeeks. All rights reserved.
//

import UIKit
import LocalAuthentication

class LocalAuthUtility {
    private static let biometricStateKey = "biometricState"
    
    static func isUsingAuth() -> Bool {
        return UserDefaults.standard.bool(forKey: biometricStateKey)
    }
    
    static func setUsingAuth(_ usingAuth: Bool) {
        UserDefaults.standard.set(usingAuth, forKey: biometricStateKey)
    }
    
    static func canEvaluatePolicyWithBiometrics() -> Bool {
        let context = LAContext()
        var error: NSError?
        return context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error)
    }
}
