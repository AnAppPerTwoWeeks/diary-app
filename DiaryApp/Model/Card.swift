//
//  Card.swift
//  DiaryApp
//
//  Created by 장창순 on 29/02/2020.
//  Copyright © 2020 AnAppPerTwoWeeks. All rights reserved.
//

import UIKit

struct Card {
    var cardImage: UIImage
    var title: String
    var date: String
    var content: String
    
    init(image: UIImage, title: String, content: String) {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateString = dateFormatter.string(from: date)
        self.cardImage = image
        self.title = title
        self.date = dateString
        self.content = content

    }
}
