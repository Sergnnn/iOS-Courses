//
//  MainVC.swift
//  MMCv2
//
//  Created by Serg Nepomyaschyy on 12.12.2021.
//

import GoogleMobileAds
import UIKit
import AppTrackingTransparency
import AdSupport
import UserNotifications

class MainVC: UIViewController, GADBannerViewDelegate {
    
    
    @IBOutlet var bannerView: GADBannerView!
    
    @IBOutlet weak var amountOfPlayersLabel: CustomMainLabel!
    @IBOutlet weak var amountOfPlayersStepper: UIStepper!
    @IBOutlet weak var startingMoneyLabel: CustomMainLabel!
    @IBOutlet weak var startingMoneyStepper: UIStepper!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNotification()
        
        bannerView.adUnitID = "ca-app-pub-1963870271091860/7878938871"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        bannerView = GADBannerView(adSize: GADAdSizeBanner)

        addBannerViewToView(bannerView)
        
        amountOfP = 4
        amountOfTransfers = 0
        amountOfPlayersStepper.value = Double(amountOfP)
        amountOfPlayersLabel.text = "\(Int(amountOfPlayersStepper.value).description)"
        startingMoneyStepper.value = 1500
        startingMoneyLabel.text = "\(Int(startingMoneyStepper.value).description)"
        
        bannerView.delegate = self
          }
    
    
    @IBAction func amountOfPlayersStepperChangeValue(_ sender: UIStepper) {
        amountOfPlayersLabel.text = Int(sender.value).description
        amountOfP = Int(sender.value)
    }
    
    @IBAction func startingMoneyStepperChangrValue(_ sender: UIStepper) {
        startingMoneyLabel.text = Int(sender.value).description
    }
    
    
    @IBAction func setNamesBtn(_ sender: Any) {
        players.append(bank)
        for i in 1...Int(amountOfPlayersStepper.value) {
            players.append(Player(id: i, name: "Player \(i)", money: Int(startingMoneyStepper.value)))
        }
    }
    
    func addBannerViewToView(_ bannerView: GADBannerView) {
      bannerView.translatesAutoresizingMaskIntoConstraints = false
      view.addSubview(bannerView)
    }
    
    func setNotification(){
       //Ask for notification permission
       let n = NotificationHandler()
       n.askNotificationPermission {
           //n.scheduleAllNotifications()
           
           //IMPORTANT: wait for 1 second to display another alert
           DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
               if #available(iOS 14, *) {
                 ATTrackingManager.requestTrackingAuthorization { (status) in
                   //print("IDFA STATUS: \(status.rawValue)")
                   //FBAdSettings.setAdvertiserTrackingEnabled(true)
                 }
               }
           }
       }
   }

}


