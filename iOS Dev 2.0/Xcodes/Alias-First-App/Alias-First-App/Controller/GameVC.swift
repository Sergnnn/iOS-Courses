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
    var timeLeft: Int = 2 //rules.roundTime
    var noTimeLeft: Bool = false
  
    @IBOutlet weak var timerLbl: UILabel!
    @IBOutlet weak var scoreOfTheRoundLbl: UILabel!
    @IBOutlet weak var wordToGuess: UILabel!
  
// MARK: - vieDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()

        wordToGuess.isHidden = false
        wordToGuess.text = getRandomWordAndRemoveIt()
        timerLbl.text = "\(rules.roundTime)"
        results[0].team = teams[teamNumber].name
        setupTimer()
        
        
        
    }
    

// MARK: - Actions
    @IBAction func correctBtn(_ sender: Any) {
        
        roundScoreCounter(true)
        setScoreOfTheRoundLbl()
        results[0].words.append(wordToGuess.text!)
        results[0].wordIsCorrect.append(true)
        results[0].score = scoreOfTheRound
        
        wordToGuess.text = getRandomWordAndRemoveIt()
        
        debugPrint(results)
        
        
        if noTimeLeft {
            
            wordToGuess.isHidden = true
            performSegue(withIdentifier: "ResultsVC", sender: nil)}
    }
    @IBAction func unCorrectBtn(_ sender: Any) {
        
        roundScoreCounter(false)
        setScoreOfTheRoundLbl()
        results[0].words.append(wordToGuess.text!)
        results[0].wordIsCorrect.append(false)
        results[0].score = scoreOfTheRound
        
        wordToGuess.text = getRandomWordAndRemoveIt()
        
        debugPrint(results)
        
        if noTimeLeft {
            
            wordToGuess.isHidden = true
            performSegue(withIdentifier: "ResultsVC", sender: nil)}
    }
// MARK: - Functions
    func setScoreOfTheRoundLbl() {
        scoreOfTheRoundLbl.text = String(scoreOfTheRound)
    }
    
    func roundScoreCounter(_ tf: Bool){
        if tf {scoreOfTheRound += 1}
        else {
            if scoreOfTheRound == 0 {scoreOfTheRound = 0}
            else {return}
        }
    }
// MARK: - Timer
    func setupTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            if self.timeLeft != 0 {
                self.timerLbl.text = "\(self.timeLeft) sec"
                self.timeLeft -= 1
            } else {
                timer.invalidate()
                self.timerLbl.text = "Time is up..."
                self.noTimeLeft = true
            }
        }
        
    }
    
}


