//
//  ViewController.swift
//  DiaryApp
//
//  Created by 장창순 on 27/02/2020.
//  Copyright © 2020 AnAppPerTwoWeeks. All rights reserved.
//

import UIKit
import RealmSwift
import LocalAuthentication

enum CellIndexType: Int {
    case cardView
    case listView
}

class CardListViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var cardViewImage: UIBarButtonItem!
    @IBOutlet weak var listViewImage: UIBarButtonItem!
    
    var cellIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        self.tabBarController?.delegate = UIApplication.shared.delegate as? UITabBarControllerDelegate
        activateAuthentication()
        setupNavBarAndTabBarUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        collectionView.reloadData()
    }
    
    func setupNavBarAndTabBarUI() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
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
    
    func activateAuthentication() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "지문 인증") { success, _ in
                DispatchQueue.main.async {
                    if success {
                        
                    } else {
                        let ac = UIAlertController(title: "인증 실패", message: "다시 시도해 주세요", preferredStyle: .alert)
                        ac.addAction(UIAlertAction(title: "확인", style: .default))
                        self.present(ac, animated: true)
                    }
                }
            }
        } else {
            let ac = UIAlertController(title: "오류", message: "생체인식을 사용할 수 없습니다 디바이스 설정을 확인해 주세요.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "확인", style: .default))
            self.present(ac, animated: true)
        }
    }
    
}

extension CardListViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return CardManager.shared.cardListCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell = CardCell()
        
        if cellIndex == CellIndexType.cardView.rawValue {
            if let reusableCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as? CardCell {
                cell = reusableCell
            }
        } else {
            if let reusableCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ListCardCell", for: indexPath) as? CardCell {
                cell = reusableCell
            }
        }
        cell.update(CardManager.shared.getCardFromList(indexPath.row))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "DetailCard", sender: indexPath.row)
    }
}
