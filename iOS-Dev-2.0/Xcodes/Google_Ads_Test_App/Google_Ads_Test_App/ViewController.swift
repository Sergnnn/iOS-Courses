//
//  ViewController.swift
//  Google_Ads_Test_App
//
//  Created by Serg Nepomyaschyy on 12.12.2021.
//
import AppTrackingTransparency
import GoogleMobileAds
import UIKit
import AdSupport



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
    
    //    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//
//        checkTrackingAuthorization(ATTrackingManager.trackingAuthorizationStatus)
//    }
//
//    private func checkTrackingAuthorization(_ status: ATTrackingManager.AuthorizationStatus) {
//        switch status {
//        case .authorized: break
//            // Access is grantted
//        case .notDetermined: requestTrackingAccess()
//            // The permission was not asked before
//        case .denied, .restricted: displayTrackingAccessAlert()
//        default: break
//            // Unexpected status (there may be additional unknown values added in the future)
//        }
//    }
//
//    private func requestTrackingAccess() {
//        ATTrackingManager.requestTrackingAuthorization { [weak self] status in
//            self?.checkTrackingAuthorization(status)
//        }
//    }
//
//    private func displayTrackingAccessAlert() {
//        let alert = UIAlertController(title: "Tracking access is required", message: "Please turn on access to tracking on the settings", preferredStyle: .alert)
//        let settingsAction = UIAlertAction(title: "Settings", style: .default, handler: { action in
//            // Open the Settings app
//            UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
//        })
//        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
//
//        alert.addAction(settingsAction)
//        alert.addAction(cancelAction)
//        alert.preferredAction = settingsAction
//
//        present(alert, animated: true, completion: nil)
//    }

    }




