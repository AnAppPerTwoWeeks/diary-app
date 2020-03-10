//
//  AddCardViewController.swift
//  DiaryApp
//
//  Created by 장창순 on 01/03/2020.
//  Copyright © 2020 AnAppPerTwoWeeks. All rights reserved.
//

import UIKit
import RealmSwift

class AddCardViewController: UIViewController {
    
    @IBOutlet weak var contentTextField: UITextField!
    // @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var photoImage: UIImageView!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var inputTextView: UIView!

    let imagePicker = UIImagePickerController()
    
    var indexPath: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        contentTextField.delegate = self
        //titleTextField.delegate = self
        setupTextFieldUI()
        setupKeyboardEventListner()
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        if indexPath != nil {
            contentTextField.text = CardManager.shared.getCardFromList(indexPath).getCardContent()
            photoImage.image = CardManager.shared.getCardFromList(indexPath).getCardImage()
            //titleTextField.text = CardManager.shared.getCardFromList(indexPath).getCardTitle()
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    func setupKeyboardEventListner() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func cancelButoonPressed(_ sender: Any) {
        checkSegueType()
    }
    
    func checkSegueType() {
        if let currentNavigationController = navigationController {
            currentNavigationController.popToRootViewController(animated: true)
        }
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func submitButtonPressed(_ sender: Any) {
        if photoImage.image == nil {
            alertIfFieldIsEmpty(message: "사진을 추가해주세요.")
            return
        } else if contentTextField.text == "" {
            alertIfFieldIsEmpty(message: "내용을 입력해주세요.")
            return
        }
        
        if indexPath != nil {
            CardManager.shared.editCardByIndex(contentTextField.text!, photoImage.image!, at: indexPath)
        } else {
            CardManager.shared.addNewCard(contentTextField.text!, photoImage.image!)
        }
        
        checkSegueType()
    }
    
    func alertIfFieldIsEmpty(message: String) {
        let notice = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        present(notice, animated: true)
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { (_) in
            self.dismiss(animated: true, completion: nil)
        }
    }
}

// MARK: - UIImagePickerController Methods
extension AddCardViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            photoImage.image = image
        }
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addPhotoPressed(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true)
    }
}

// MARK: - UITextFieldDelegate Mothods
extension AddCardViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        hideKeyboard()
        return true
    }
    
    func hideKeyboard() {
        contentTextField.resignFirstResponder()
        //titleTextField.resignFirstResponder()
    }
    
    @objc func keyboardWillChange(notification: Notification) {
        guard let keyboardRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }
        
        if (notification.name == UIResponder.keyboardWillShowNotification) || (notification.name == UIResponder.keyboardWillChangeFrameNotification) {
            inputTextView.frame.origin.y = -keyboardRect.height
            
        } else {
            inputTextView.frame.origin.y = -90
        }
    }
    
    func setupTextFieldUI() {
        let borderColor = UIColor.white
        contentTextField.layer.borderWidth = 1
        contentTextField.layer.borderColor = borderColor.cgColor
        //        titleTextField.layer.borderWidth = 1
        //titleTextField.layer.borderColor = borderColor.cgColor
    }
}
