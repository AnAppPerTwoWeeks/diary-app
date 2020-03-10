//
//  AdmobController.swift
//  DiaryApp
//
//  Created by 장창순 on 11/03/2020.
//  Copyright © 2020 AnAppPerTwoWeeks. All rights reserved.
//

import Foundation
import GoogleMobileAds

// helper class, utility
class AdmobController {
    public static func setupBannerView(toViewController viewController: UIViewController) {
        let adSize = GADAdSizeFromCGSize(CGSize(width: viewController.view.frame.width, height: 50))
        let bannerView = GADBannerView(adSize: adSize)
        addBannerView(bannerView, toViewController: viewController)
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        //실제 광고 단위 ca-app-pub-5869826399158816/3860128194
        bannerView.rootViewController = viewController
        bannerView.load(GADRequest())
    }
    
    private static func addBannerView(_ bannerView: GADBannerView, toViewController viewController: UIViewController) {
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        if let view = viewController.view {
            view.addSubview(bannerView)
            view.addConstraints(
                [NSLayoutConstraint(item: bannerView,
                                    attribute: .bottom,
                                    relatedBy: .equal,
                                    toItem: view.safeAreaLayoutGuide,
                                    attribute: .bottom,
                                    multiplier: 1,
                                    constant: 0),
                 NSLayoutConstraint(item: bannerView,
                                    attribute: .centerX,
                                    relatedBy: .equal,
                                    toItem: view,
                                    attribute: .centerX,
                                    multiplier: 1,
                                    constant: 0)
            ])
        }
    }
}
