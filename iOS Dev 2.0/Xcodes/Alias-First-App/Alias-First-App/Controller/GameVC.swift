//
//  GameVC.swift
//  Alias-First-App
//
//  Created by Сергей Непомящий on 09.02.2021.
//

import UIKit

class GameVC: UIViewController {
// MARK: - Variables
    var timer: Timer?
    var timeLeft: Int = rules.roundTime
    var noTimeLeft: Bool = false
    
    @IBOutlet weak var timerLbl: UILabel!
    @IBOutlet weak var scoreOfTheRoundLbl: UILabel!
    @IBOutlet weak var wordToGuess: UILabel!
  
// MARK: - vieDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()

        wordToGuess.text = getRandomWordAndRemoveIt()
        timerLbl.text = "\(rules.roundTime)"
        setupTimer()
        
        
    }
    

// MARK: - Actions
    @IBAction func correctBtn(_ sender: Any) {
        wordToGuess.text = getRandomWordAndRemoveIt()
        roundScoreCounter(true)
        setScoreOfTheRoundLbl()
        print(scoreOfTheRound)
        print(wordsForTheRound)
        
        if noTimeLeft {performSegue(withIdentifier: "ResultsVC", sender: nil)}
    }
    @IBAction func unCorrectBtn(_ sender: Any) {
        wordToGuess.text = getRandomWordAndRemoveIt()
        roundScoreCounter(false)
        setScoreOfTheRoundLbl()
        print(scoreOfTheRound)
        print(wordsForTheRound)
        
        if noTimeLeft {performSegue(withIdentifier: "ResultsVC", sender: nil)}
    }
// MARK: - Functions
    func setScoreOfTheRoundLbl() {
        scoreOfTheRoundLbl.text = String(scoreOfTheRound)
    }
    
    func roundScoreCounter(_ tf: Bool){
        if tf {scoreOfTheRound += 1}
        else {
            if scoreOfTheRound == 0 {scoreOfTheRound = 0}
            else {scoreOfTheRound -= 1}
        }
    }
// MARK: - Timer
    func setupTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            if self.timeLeft != 0 {
                self.timerLbl.text = String(self.timeLeft)
                self.timeLeft -= 1
            } else {
                timer.invalidate()
                self.timerLbl.text = "Time is up..."
                self.noTimeLeft = true
            }
        }
        
    }
    
}


