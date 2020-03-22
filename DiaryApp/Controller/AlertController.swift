//
//  AlertController.swift
//  DiaryApp
//
//  Created by 장창순 on 22/03/2020.
//  Copyright © 2020 AnAppPerTwoWeeks. All rights reserved.
//

import UIKit

class AlertController {
    static func alert(title: String, message: String, withViewController viewController: UIViewController) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "확인", style: .default))
        viewController.present(ac, animated: true)
    }
}
