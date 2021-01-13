//
//  ViewController.swift
//  Monopoly Money Counter
//
//  Created by Сергей Непомящий on 09.01.2021.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet weak var amountOfPlayersLabel: CustomMainLabel!
    @IBOutlet weak var amountOfPlayersStepper: UIStepper!
    @IBOutlet weak var startingMoneyLabel: CustomMainLabel!
    @IBOutlet weak var startingMoneyStepper: UIStepper!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        amountOfP = 4
        amountOfTransfers = 0
        
        amountOfPlayersStepper.value = Double(amountOfP)
        amountOfPlayersLabel.text = "\(Int(amountOfPlayersStepper.value).description)"
        startingMoneyStepper.value = 1500
        startingMoneyLabel.text = "\(Int(startingMoneyStepper.value).description)"
        
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
        
        
    
    
   
}

