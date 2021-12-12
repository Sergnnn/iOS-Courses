//
//  ViewController.swift
//  Google_Ads_Test_App
//
//  Created by Serg Nepomyaschyy on 12.12.2021.
//
import GoogleMobileAds
import UIKit


class ViewController: UIViewController, GADBannerViewDelegate {
    
    @IBOutlet var bannerView: GADBannerView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        bannerView.adUnitID = "ca-app-pub-1963870271091860/3618427257"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        bannerView = GADBannerView(adSize: GADAdSizeBanner)

        addBannerViewToView(bannerView)
        
        bannerView.delegate = self
         }

         func addBannerViewToView(_ bannerView: GADBannerView) {
           bannerView.translatesAutoresizingMaskIntoConstraints = false
           view.addSubview(bannerView)
         }

    }




