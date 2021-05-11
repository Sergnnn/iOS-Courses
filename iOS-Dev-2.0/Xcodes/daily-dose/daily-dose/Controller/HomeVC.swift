//
//  ViewController.swift
//  daily-dose
//
//  Created by Сергей Непомящий on 29.01.2021.
//

import GoogleMobileAds
import UIKit

  

class HomeVC: UIViewController {
    
@IBOutlet var bannerView: GADBannerView!

    override func viewDidLoad() {
        super.viewDidLoad()
      
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        
    }


}

