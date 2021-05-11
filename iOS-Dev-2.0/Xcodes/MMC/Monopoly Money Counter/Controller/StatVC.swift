//
//  StatVC.swift
//  Monopoly Money Counter
//
//  Created by Сергей Непомящий on 10.01.2021.
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
