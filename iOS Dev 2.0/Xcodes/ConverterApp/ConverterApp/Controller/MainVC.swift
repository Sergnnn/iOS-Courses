//
//  ViewController.swift
//  ConverterApp
//
//  Created by Сергей Непомящий on 02.01.2021.
//

import UIKit

class MainVC: UIViewController {

    
   
   
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var numbersTextField: CustomTextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var buttonLabel: CustomCalculateButton!
    
    
    @IBAction func CalculateBtn1(_ sender: Any) {
        if let numberTxt = numbersTextField.text, let text = textLabel.text {
            if let number = Double(numberTxt) {
                
                resultLabel.isHidden = false
                view.endEditing(true)
                resultLabel.text = "\(converter.ConvertorMK(ConvertationType: text, Number: number)) \(text)"
            }
        }
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
        
    

    @IBAction func segmentedControlTapped(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex {
        case 0: textLabel.text = "km"; buttonLabel.setTitle("Calculate in KM", for: .normal); resultLabel.isHidden = true
        case 1: textLabel.text = "ml"; buttonLabel.setTitle("Calculate in ML", for: .normal); resultLabel.isHidden = true
        case 2: textLabel.text = "kg"; buttonLabel.setTitle("Calculate in KG", for: .normal); resultLabel.isHidden = true
        case 3: textLabel.text = "pd"; buttonLabel.setTitle("Calculate in PD", for: .normal); resultLabel.isHidden = true
        default: break
        }
    }
    
}

