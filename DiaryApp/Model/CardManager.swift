//
//  CardManager.swift
//  DiaryApp
//
//  Created by 장창순 on 02/03/2020.
//  Copyright © 2020 AnAppPerTwoWeeks. All rights reserved.
//

import UIKit
import RealmSwift

class RealmUtility<T: Object> {

    private var realm = try! Realm()

    func all() -> Results<T> {
        return realm.objects(T.self)
    }

    func save(_ object: T) {
        do {
            try realm.write {
                realm.add(object)
            }
        } catch {
            print(error)
        }
    }

    func delete(_ object: T) {
        do {
            try realm.write {
                realm.delete(object)
            }
        } catch {
            print(error)
        }
    }

    func edit(process: () -> Void) {
        do {
            try realm.write {
                process()
            }
        } catch {
            print(error)
        }
    }
}

class CardManager {

    static let shared = CardManager()

    private let realmUtility = RealmUtility<Card>()

    private var cardList: Results<Card>?

    var cardListCount: Int {
            cardList?.count ?? 0
    }

    private init() {
        cardList = realmUtility.all().sorted(byKeyPath: "date", ascending: false)
    }

    func getCardFromList(_ at: Int) -> Card {
        return cardList![at]
    }

    func delete(_ object: Card) {
        realmUtility.delete(object)
    }

    func addNewCard(_ content: String, _ image: UIImage) {
        let newCard = Card(content, image)
        realmUtility.save(newCard)
    }

    func editCardByIndex(_ content: String, _ image: UIImage, at: Int ) {
        realmUtility.edit {
            cardList![at].content = content
            //cardList![at].title = title
            cardList![at].image = NSData(data: image.jpegData(compressionQuality: 0.7)!)
        }
    }
}
