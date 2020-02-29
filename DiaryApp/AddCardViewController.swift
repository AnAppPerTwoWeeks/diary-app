//
//  AddCardViewController.swift
//  DiaryApp
//
//  Created by 장창순 on 01/03/2020.
//  Copyright © 2020 AnAppPerTwoWeeks. All rights reserved.
//

import UIKit

class AddCardViewController: UIViewController {

    @IBOutlet weak var contentTextField: UITextField!
    @IBOutlet weak var titleTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        let borderColor = UIColor.white
        titleTextField.layer.borderWidth = 1
        titleTextField.layer.borderColor = borderColor.cgColor
        contentTextField.layer.borderWidth = 1
        contentTextField.layer.borderColor = borderColor.cgColor
    }


}
