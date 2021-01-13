//
//  StatVC.swift
//  Monopoly Money Counter
//
//  Created by Сергей Непомящий on 10.01.2021.
//

import UIKit

class StatVC: UIViewController {

    @IBOutlet weak var amountOfTransfersLabel: CustomMainLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        amountOfTransfersLabel.text = "\(amountOfTransfers)"
        players = [Player]()
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
