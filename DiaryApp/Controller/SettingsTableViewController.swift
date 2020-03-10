//
//  SettingsTableViewController.swift
//  DiaryApp
//
//  Created by 장창순 on 08/03/2020.
//  Copyright © 2020 AnAppPerTwoWeeks. All rights reserved.
//

import UIKit
import LocalAuthentication

class SettingsTableViewController: UITableViewController {
    
    @IBOutlet weak var biometricLabel: UILabel!
    @IBOutlet weak var biometricSwitch: UISwitch!
    @IBOutlet weak var openSourceLicenseLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        biometricSwitch.isOn = UserDefaults.standard.bool(forKey: "biometricState")
        biometricLabel.text = "Face ID / Touch ID"
        openSourceLicenseLabel.text = "오픈소스 라이브러리"
        AdmobController.setupBannerView(toViewController: self)
    }
    
    @IBAction func toggleBiometricActivation(_ sender: Any) {
        if biometricSwitch.isOn != true {
            UserDefaults.standard.set(self.biometricSwitch.isOn, forKey: "biometricState")
        } else {
            biometricActivation()
        }
    }
    
    func biometricActivation() {
        
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "지문 인증") { success, _ in
                DispatchQueue.main.async {
                    if success {
                        UserDefaults.standard.set(self.biometricSwitch.isOn, forKey: "biometricState")
                    } else {
                        let ac = UIAlertController(title: "오류", message: "생체인식을 사용할 수 없습니다 디바이스 설정을 확인해 주세요.", preferredStyle: .alert)
                        ac.addAction(UIAlertAction(title: "확인", style: .default, handler: { _ in
                            self.biometricSwitch.isOn = false
                            UserDefaults.standard.set(self.biometricSwitch.isOn, forKey: "biometricState")
                        }))
                        self.present(ac, animated: true)
                    }
                }
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
