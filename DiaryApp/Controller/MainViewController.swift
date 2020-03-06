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
    @IBOutlet weak var cardViewImage: UIBarButtonItem!
    @IBOutlet weak var listViewImage: UIBarButtonItem!
    
    
    
    var cellIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.delegate = UIApplication.shared.delegate as? UITabBarControllerDelegate
        setupNavBarAndTabBarUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
      collectionView.reloadData()
    }
    
    func setupNavBarAndTabBarUI() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.tabBarController?.tabBar.clipsToBounds = true
        self.tabBarController?.tabBar.standardAppearance.shadowImage = nil
        self.tabBarController?.tabBar.standardAppearance.shadowColor = nil
        self.cardViewImage.image = UIImage(named: "cardView_selected")
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier != "DetailCard" {
            return
        } else {
            if let detailCard = segue.destination as? DetailCardViewController {
                if let index = sender as? Int {
                    detailCard.indexPath = index
                }
            }
        }
    }
    
    @IBAction func cardViewButtonPressed(_ sender: Any) {
        cellIndex = 0
        cardViewImage.image = UIImage(named: "cardView_selected")
        listViewImage.image = UIImage(named: "listView_unselected")
        collectionView.reloadData()
    }
    
    
    @IBAction func listViewButtonPressed(_ sender: Any) {
        cellIndex = 1
        cardViewImage.image = UIImage(named: "cardView_unselected")
        listViewImage.image = UIImage(named: "listView_selected")
        collectionView.reloadData()
    }
}

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return CardManager.shared.cardListCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell: CardCell
        
        switch cellIndex {
        case 0:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as! CardCell
        case 1:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ListCardCell", for: indexPath) as! CardCell
        default:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as! CardCell
        }
        cell.update(CardManager.shared.getCardFromList(indexPath.row))
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "DetailCard", sender: indexPath.row)
    }
}
