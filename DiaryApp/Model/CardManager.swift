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
    
    var realm = try! Realm()
    
    var cardList: Results<Card>?
    
    var getCardListCount: Int {
        get {
            cardList?.count ?? 0
        }
    }
    
    init() {
        loadCardList()
    }
    
    func getCardFromList(_ at: Int) -> Card {
        return cardList![at]
    }
    
    func saveCard(_ card: Card) {
        do {
            try realm.write {
                realm.add(card)
            }
        } catch {
            print(error)
        }
    }
    
    func loadCardList() {
        cardList = realm.objects(Card.self)
    }
    
    func addNewCard(title: String, content: String, image: UIImage) {
        let newCard = Card(title, content, image)
        saveCard(newCard)
    }
}
