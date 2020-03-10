//
//  AuthViewController.swift
//  DiaryApp
//
//  Created by 장창순 on 10/03/2020.
//  Copyright © 2020 AnAppPerTwoWeeks. All rights reserved.
//

import UIKit
import LocalAuthentication

class AuthViewController: UIViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDefaults.standard.bool(forKey: "biometricState") == false {
            performSegue(withIdentifier: "AuthSegue", sender: nil)
        } else {
            activateAuthentication()
        }
    }
    
    func activateAuthentication() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "지문 인증") { success, _ in
                DispatchQueue.main.async {
                    if success {
                        self.performSegue(withIdentifier: "AuthSegue", sender: nil)
                    } else {
                        let ac = UIAlertController(title: "인증 실패", message: "다시 시도해 주세요", preferredStyle: .alert)
                        ac.addAction(UIAlertAction(title: "확인", style: .default))
                        self.present(ac, animated: true)
                    }
                }
            }
        } else {
            let ac = UIAlertController(title: "오류", message: "생체인식을 사용할 수 없습니다 디바이스 설정을 확인해 주세요.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "확인", style: .default))
            self.present(ac, animated: true)
        }
    }
    
    
    
}
