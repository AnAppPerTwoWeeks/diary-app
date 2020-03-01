//
//  ViewController.swift
//  DiaryApp
//
//  Created by 장창순 on 27/02/2020.
//  Copyright © 2020 AnAppPerTwoWeeks. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
//    var cardList = [Card(image: UIImage(named: "01.jpg")!, title: "첫번째 카드", content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."),Card(image: UIImage(named: "02.jpg")!, title: "두번째 카드", content: "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."),Card(image: UIImage(named: "03.jpg")!, title: "세번째 카드", content: "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur."), Card(image: UIImage(named: "04.jpg")!, title: "네번째 카드", content: "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."), Card(image: UIImage(named: "05.jpg")!, title: "다섯번째 카드", content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.") ]
    
    var cardList = [Card]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        setupNavBarAndTabBarUI()
        
    }
    
    func setupNavBarAndTabBarUI() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.tabBarController?.tabBar.clipsToBounds = true
        self.tabBarController?.tabBar.standardAppearance.shadowImage = nil
        self.tabBarController?.tabBar.standardAppearance.shadowColor = nil
    }
}

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cardList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as! CardCell
        //cell.image.image = cardList[indexPath.row].cardImage
        cell.title.text = cardList[indexPath.row].title
        cell.date.text = cardList[indexPath.row].date
        cell.content.text = cardList[indexPath.row].content

        cell.layoutSubviews()
        return cell
    }
}
