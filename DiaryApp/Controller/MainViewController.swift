//
//  ViewController.swift
//  DiaryApp
//
//  Created by 장창순 on 27/02/2020.
//  Copyright © 2020 AnAppPerTwoWeeks. All rights reserved.
//

import UIKit
import RealmSwift

class MainViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let cardManager = CardManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        setupNavBarAndTabBarUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
      collectionView.reloadData()
    }
    
    func setupNavBarAndTabBarUI() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.tabBarController?.tabBar.clipsToBounds = true
        self.tabBarController?.tabBar.standardAppearance.shadowImage = nil
        self.tabBarController?.tabBar.standardAppearance.shadowColor = nil
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailCard" {
            if let detailCard = segue.destination as? DetailCardViewController {
                if let index = sender as? Int {
                    detailCard.cardManager = cardManager
                    detailCard.indexPath = index
                }
            }
        }
    }
}

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cardManager.getCardListCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as! CardCell
        cell.update(cardManager.getCardFromList(indexPath.row))
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "DetailCard", sender: indexPath.row)
    }
}
