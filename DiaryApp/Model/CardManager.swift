//
//  CardManager.swift
//  DiaryApp
//
//  Created by 장창순 on 02/03/2020.
//  Copyright © 2020 AnAppPerTwoWeeks. All rights reserved.
//

import UIKit
import RealmSwift

class CardManager {
    
    static let shared = CardManager()
    
    private var realm = try! Realm()
    
    private var cardList: Results<Card>?
    
    var cardListCount: Int {
        get {
            cardList?.count ?? 0
        }
    }
    
    private init() {
        cardList = realm.objects(Card.self)
    }
    
    func getCardFromList(_ at: Int) -> Card {
        return cardList![at]
    }
    
    func save<T: Object>(_ object: T) {
        do {
            try realm.write {
                realm.add(object)
            }
        } catch {
            print(error)
        }
    }
    
    func addNewCard(title: String, content: String, image: UIImage) {
        let newCard = Card(title, content, image)
        save(newCard)
    }
}
