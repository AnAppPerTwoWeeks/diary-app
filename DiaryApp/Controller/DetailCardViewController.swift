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
        let card = CardManager.shared.getCardFromList(indexPath)
        cardContent.text = card.getCardContent()
        cardDate.text = card.getCardDate()
        cardImage.image = card.getCardImage()
        //cardTitle.text = card.getCardTitle()
    }
    
    @IBAction func moreButtonPressed(_ sender: Any) {
        
        let alert = UIAlertController(title: nil, message: nil , preferredStyle: .actionSheet)
        
        let editAction = UIAlertAction(title: "수정", style: .default) { (action) in
            self.performSegue(withIdentifier: "EditCard", sender: self.indexPath)
        }
        
        let deleteAction = UIAlertAction(title: "삭제", style: .destructive) { (action) in
            CardManager.shared.delete(CardManager.shared.getCardFromList(self.indexPath))
            self.navigationController?.popViewController(animated: false)
        }
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
        
        alert.addAction(editAction)
        alert.addAction(deleteAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier != "EditCard" {
            return
        }
        
        if let editCard = segue.destination as? AddCardViewController {
            editCard.indexPath = indexPath
        }
    }
    
}
