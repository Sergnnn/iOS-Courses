//
//  NameVC.swift
//  MMCv2
//
//  Created by Serg Nepomyaschyy on 12.12.2021.
//

import GoogleMobileAds
import UIKit

class NamesVC: UIViewController, UITextFieldDelegate, GADBannerViewDelegate {

    @IBOutlet var bannerView: GADBannerView!
    
    @IBOutlet weak var stack: UIStackView!
    @IBOutlet weak var firstTxtField: CustomPlayersTxtField!
    
    var otherTxtField = [CustomPlayersTxtField]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bannerView.adUnitID = "ca-app-pub-1963870271091860/1551161956"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        bannerView = GADBannerView(adSize: GADAdSizeBanner)
        addBannerViewToView(bannerView)
        bannerView.delegate = self
        
        firstTxtField.placeholder = "Player 1"
        self.firstTxtField.delegate = self
        firstTxtField.customizeView()
        
        print("amount of element in array: \(amountOfP)")
        for i in 2...amountOfP {
            createTxtField("Player \(i)")
            
            
        }
    }
    
  
    func createTxtField(_ title: String) {
        
        let txtField = CustomPlayersTxtField()
        txtField.placeholder = title
        txtField.delegate = self
        txtField.customizeView()
        otherTxtField.append(txtField)
        stack.addArrangedSubview(txtField)
    }

    
    @IBAction func PlayBtn(_ sender: Any) {
        players[1].name = firstTxtField.text!
        
        if firstTxtField.text == "" {
            players[1].name = "Player 1"
        } else{
        players[1].name = firstTxtField.text!
        }
        
        for i in 2...(players.count - 1) {
            if otherTxtField[i - 2].text == "" {
                players[i].name = "Player \(i)"
            } else{
            players[i].name = otherTxtField[i - 2].text!
            }
        }
        print(players.description)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func addBannerViewToView(_ bannerView: GADBannerView) {
      bannerView.translatesAutoresizingMaskIntoConstraints = false
      view.addSubview(bannerView)
    }
    
}

