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
    @objc dynamic var image: NSData!
    @objc dynamic var title: String!
    @objc dynamic var date: Date!
    @objc dynamic var content: String!
    
    convenience init(_ title: String, _ content: String, _ image: UIImage) {
        self.init()
        self.title = title
        self.content = content
        self.date = Date()
        self.image = NSData(data: image.jpegData(compressionQuality: 0.7)!)
    }
    
    func getCardTitle() -> String {
        return title
    }
    
    func getCardContent() -> String {
        return content
    }
    
    func getCardDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy년 MM월 dd일"
        return dateFormatter.string(from: date)
    }
    
    func getCardImage() -> UIImage {
        var cardImage = UIImage()
        if let imageData = UIImage(data: image as Data) {
            cardImage = imageData
        }
        return cardImage
    }
}
