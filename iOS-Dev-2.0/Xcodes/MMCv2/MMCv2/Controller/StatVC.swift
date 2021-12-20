//
//  StatVC.swift
//  MMCv2
//
//  Created by Serg Nepomyaschyy on 12.12.2021.
//

import GoogleMobileAds
import UIKit

class StatVC: UIViewController, GADBannerViewDelegate {

    @IBOutlet var bannerView: GADBannerView!
    
    @IBOutlet weak var amountOfTransfersLabel: CustomMainLabel!
    @IBOutlet weak var timePlayedLabel: CustomMainLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bannerView.adUnitID = "ca-app-pub-1963870271091860/1551161956"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        bannerView = GADBannerView(adSize: GADAdSizeBanner)
        addBannerViewToView(bannerView)
        bannerView.delegate = self
        
        setTimeEnd()
        
        players = [Player]()

        amountOfTransfersLabel.text = "\(amountOfTransfers)"
        timePlayedLabel.text = "\(diff().hours):\(diff().minutes)"
     
    }
    
    func addBannerViewToView(_ bannerView: GADBannerView) {
      bannerView.translatesAutoresizingMaskIntoConstraints = false
      view.addSubview(bannerView)
    }
    

}

