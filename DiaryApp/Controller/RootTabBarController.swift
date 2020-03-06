//
//  RootTabBarController.swift
//  DiaryApp
//
//  Created by kakaogames on 2020/03/06.
//  Copyright © 2020 AnAppPerTwoWeeks. All rights reserved.
//

import UIKit

class RootTabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self;
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
    // if 문 밖에서 return 을 또 해줘야하는데 이런 상황에서 얼리리턴을 해야하는가?
            
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
