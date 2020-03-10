//
//  SettingsTableViewController.swift
//  DiaryApp
//
//  Created by 장창순 on 08/03/2020.
//  Copyright © 2020 AnAppPerTwoWeeks. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {

    @IBOutlet weak var biometricLabel: UILabel!
    @IBOutlet weak var biometricSwitch: UISwitch!
    @IBOutlet weak var openSourceLicenseLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        biometricSwitch.isOn = false
        biometricLabel.text = "Face ID / Touch ID"
        openSourceLicenseLabel.text = "오픈소스 라이브러리"

    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
