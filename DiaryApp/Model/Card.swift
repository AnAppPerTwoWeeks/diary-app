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
    @objc dynamic var cardImage: NSData = NSData()
    @objc dynamic var title: String = ""
    @objc dynamic var date: String = ""
    @objc dynamic var content: String = ""
    

//    init(title: String, content: String) {
//        let date = Date()
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy-MM-dd"
//        let dateString = dateFormatter.string(from: date)
//       // self.cardImage = image
//        self.title = title
//        self.date = dateString
//        self.content = content
//
//    }
}
