//
//  RootTabBarController.swift
//  DiaryApp
//
//  Created by 장창순 on 07/03/2020.
//  Copyright © 2020 AnAppPerTwoWeeks. All rights reserved.
//

import UIKit

class RootTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        if !(viewController is AddCardViewController) {
            return true
        }
        
        if let newVC = tabBarController.storyboard?.instantiateViewController(withIdentifier: "AddCard") {
            let navigationController = UINavigationController(rootViewController: newVC)
            navigationController.modalPresentationStyle = .fullScreen
            tabBarController.present(navigationController, animated: true)
            return false
        } else {
            return true
        }
    }
}
