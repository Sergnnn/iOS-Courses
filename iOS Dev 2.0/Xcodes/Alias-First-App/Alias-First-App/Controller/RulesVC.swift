//
//  RulesVC.swift
//  Alias-First-App
//
//  Created by Сергей Непомящий on 04.01.2021.
//

import UIKit

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
        generalWordSwitch.isOn = false
        soundInGameSwitch.isOn = false
        
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

        print(rules.amountOfWords)
        print(rules.roundTime)
        print(rules.minusWord)
        print(rules.generalWord)
        print(rules.soundInGame)
    }
    
}
