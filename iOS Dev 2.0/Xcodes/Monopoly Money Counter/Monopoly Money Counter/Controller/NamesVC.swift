//
//  NamesVC.swift
//  Monopoly Money Counter
//
//  Created by Сергей Непомящий on 09.01.2021.
//

import UIKit

class NamesVC: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var stack: UIStackView!
    @IBOutlet weak var firstTxtField: CustomPlayersTxtField!
    
    var otherTxtField = [CustomPlayersTxtField]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        firstTxtField.placeholder = "Player 1"
        self.firstTxtField.delegate = self
        
        
        print("amount of element in array: \(amountOfP)")
        for i in 2...amountOfP {
            createTxtField("Player \(i)")
        }
    }
    
  
    func createTxtField(_ title: String) {
        
        let txtField = CustomPlayersTxtField()
        txtField.customizeView()
        txtField.placeholder = title
        txtField.delegate = self
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
    
    
}
