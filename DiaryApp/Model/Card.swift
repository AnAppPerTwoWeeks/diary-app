//
//  Card.swift
//  DiaryApp
//
//  Created by 장창순 on 29/02/2020.
//  Copyright © 2020 AnAppPerTwoWeeks. All rights reserved.
//

import UIKit
import RealmSwift

class Card: Object {
    @objc dynamic var image: NSData = NSData()
    @objc dynamic var title: String = ""
    @objc dynamic var date: String = ""
    @objc dynamic var content: String = ""
    
    convenience init(_ title: String, _ content: String, _ image: UIImage) {
        self.init()
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy년 MM월 dd일"
        let dateString = dateFormatter.string(from: date)
        let imageData = NSData(data: image.jpegData(compressionQuality: 0.7)!)
        
        self.title = title
        self.content = content
        self.date = dateString
        self.image = imageData
    }
    
    func getCardTitle() -> String {
        return title
    }
    
    func getCardContent() -> String {
        return content
    }
    
    func getCardDate() -> String {
        return date
    }
    
    func getCardImage() -> UIImage {
        var cardImage = UIImage()
        if let imageData = UIImage(data: image as Data) {
            cardImage = imageData
        }
        return cardImage
    }
}
