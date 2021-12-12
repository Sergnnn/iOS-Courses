//
//  StatVC.swift
//  MMCv2
//
//  Created by Serg Nepomyaschyy on 12.12.2021.
//


import UIKit

class StatVC: UIViewController {

    @IBOutlet weak var amountOfTransfersLabel: CustomMainLabel!
    @IBOutlet weak var timePlayedLabel: CustomMainLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTimeEnd()
        
        players = [Player]()

        amountOfTransfersLabel.text = "\(amountOfTransfers)"
        timePlayedLabel.text = "\(diff().hours):\(diff().minutes)"
        
      
        
    }
    

}

