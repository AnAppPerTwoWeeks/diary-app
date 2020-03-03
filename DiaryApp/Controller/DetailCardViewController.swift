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
    
    var indexPath: Int!
    
    override func viewWillAppear(_ animated: Bool) {
        cardContent.text = CardManager.shared.getCardFromList(indexPath).getCardContent()
        cardTitle.text = CardManager.shared.getCardFromList(indexPath).getCardTitle()
        cardDate.text = CardManager.shared.getCardFromList(indexPath).getCardDate()
        cardImage.image = CardManager.shared.getCardFromList(indexPath).getCardImage()
    }
}
