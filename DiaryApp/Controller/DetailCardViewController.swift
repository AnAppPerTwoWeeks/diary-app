//
//  DetailCardViewController.swift
//  DiaryApp
//
//  Created by 장창순 on 02/03/2020.
//  Copyright © 2020 AnAppPerTwoWeeks. All rights reserved.
//

import UIKit

class DetailCardViewController: UIViewController {

    @IBOutlet weak var cardContent: UILabel!
    @IBOutlet weak var cardDate: UILabel!
    @IBOutlet weak var cardTitle: UILabel!
    @IBOutlet weak var cardImage: UIImageView!
    
    var cardManager = CardManager()
    var indexPath = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDetailCard(cardManager, indexPath)
    }
    
    func setupDetailCard(_ manager: CardManager, _ index: Int) {
        cardContent.text = manager.getCardFromList(index).getCardContent()
        cardTitle.text = manager.getCardFromList(index).getCardTitle()
        cardDate.text = manager.getCardFromList(index).getCardDate()
        cardImage.image = manager.getCardFromList(index).getCardImage()
    }

}
