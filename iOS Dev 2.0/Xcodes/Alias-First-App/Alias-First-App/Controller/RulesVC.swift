//
//  RulesVC.swift
//  Alias-First-App
//
//  Created by Сергей Непомящий on 04.01.2021.
//

import UIKit
import CoreData

class RulesVC: UIViewController {
    
    @IBOutlet weak var wordsAmountLabel: CustomNumberTitleForRules!
    @IBOutlet weak var wordsAmountSlider: UISlider!
    @IBOutlet weak var roundTimeLabel: CustomNumberTitleForRules!
    @IBOutlet weak var roundTimeSlider: UISlider!
    
    @IBOutlet weak var minusWordSwitch: UISwitch!
    @IBOutlet weak var generalWordSwitch: UISwitch!
    @IBOutlet weak var soundInGameSwitch: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        wordsAmountSlider.value = 50
        wordsAmountLabel.text = "\(Int(wordsAmountSlider.value))"
        roundTimeSlider.value = 60
        roundTimeLabel.text = "\(Int(roundTimeSlider.value))"
        
        minusWordSwitch.isOn = false
        generalWordSwitch.isOn = true
        soundInGameSwitch.isOn = true
        
        roundCounter = 1
        
    }
    
    
    @IBAction func wordsAmountSliderValueChanged(_ sender: UISlider) {
        let currentValue = Int(sender.value)
        wordsAmountLabel.text = "\(currentValue)"
        amountOfWords = currentValue
    }
    
    @IBAction func roundTimeSliderValueChanged(_ sender: UISlider) {
        let currentValue = Int(sender.value)
        roundTimeLabel.text = "\(currentValue)"
        roundTime = currentValue
    }
    
        
    @IBAction func playBtn(_ sender: UIButton) {
        rules.amountOfWords = Int(wordsAmountSlider.value)
        rules.roundTime = Int(roundTimeSlider.value)
        rules.minusWord = minusWordSwitch.isOn
        rules.generalWord = generalWordSwitch.isOn
        rules.soundInGame = soundInGameSwitch.isOn

        debugPrint("Amount of words - \(rules.amountOfWords)")
        debugPrint("Round Time - \(rules.roundTime)")
        debugPrint("Minus Words - \(rules.minusWord)")
        debugPrint("GeneralWord - \(rules.generalWord)")
        debugPrint("Sounds - \(rules.soundInGame)")
    }
    
}
