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
    @objc dynamic var date: Date!
    @objc dynamic var content: String!
    
    convenience init(_ content: String, _ image: UIImage) {
        self.init()
        self.content = content
        self.date = Date()
        self.image = NSData(data: image.jpegData(compressionQuality: 0.7)!)
    }
    
    func getCardContent() -> String {
        return content
    }
    
    func getCardDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy년 MM월 dd일"
        return dateFormatter.string(from: date)
    }
    
    func getCardImage() -> UIImage? {
        if let imageData = UIImage(data: image as Data) {
            return imageData
        } else {
            return nil
        }
    }
}
