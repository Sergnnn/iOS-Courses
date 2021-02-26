//
//  GameVC.swift
//  Alias-First-App
//
//  Created by Сергей Непомящий on 09.02.2021.
//

import UIKit
import AVFoundation

class GameVC: UIViewController {
// MARK: - Variables
    var timer: Timer?
    var timeLeft: Int = 15 //rules.roundTime
    var noTimeLeft: Bool = false
    var pauseTime: Int = 0
    
    @IBOutlet weak var timerLbl: UILabel!
    @IBOutlet weak var scoreOfTheRoundLbl: UILabel!
    @IBOutlet weak var wordToGuess: UILabel!
    @IBOutlet weak var pauseView: UIView!
    
// MARK: - vieDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()

        pauseView.isHidden = true
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
        Vibration.success.vibrate()
        Sounds.correctWord.play()
        debugPrint(results)
        
        if noTimeLeft {
            wordToGuess.isHidden = true
            showAlert()
        }
    }
    @IBAction func unCorrectBtn(_ sender: Any) {
        roundScoreCounter(false)
        setScoreOfTheRoundLbl()
        results[0].words.append(wordToGuess.text!)
        results[0].wordIsCorrect.append(false)
        results[0].score = scoreOfTheRound
        wordToGuess.text = getRandomWordAndRemoveIt()
        Vibration.error.vibrate()
        Sounds.unCorrectWord.play()
        debugPrint(results)
        
        if noTimeLeft {
            wordToGuess.isHidden = true
            performSegue(withIdentifier: "ResultsVC", sender: nil)}
    }
    
    @IBAction func pauseBtn(_ sender: Any) {
        if timeLeft > 2{
        pauseView.isHidden = false
        }
    }
    @IBAction func unPauseBtn(_ sender: Any) {
        wordToGuess.text = getRandomWordAndRemoveIt()
        pauseView.isHidden = true
    }
    //MARK: - Config Alert
        
        func showAlert() {
            let refreshAlert = UIAlertController(title: "Выберите команду, которая угадала слово:", message: "", preferredStyle: UIAlertController.Style.alert)
            
            for i in 0...teams.count - 1{
                
                refreshAlert.addAction(UIAlertAction(title: "\(teams[i].name)", style: .default, handler: { (action: UIAlertAction!) in
                    debugPrint("Handle \(teams[i].name) logic here")
                    self.addGeneralWord(teamName: teams[i].name)
                    self.performSegue(withIdentifier: "ResultsVC", sender: nil)
                }))
            }

            present(refreshAlert, animated: true, completion: nil)
        }

    func addGeneralWord(teamName: String) {
        if results[0].team != teamName {
            results.append(result(team: teamName, score: 1, words: [results[0].words.last!], wordIsCorrect: [true]))
            results[0].score -= 1
            results[0].wordIsCorrect.removeLast()
            results[0].words.removeLast()
        }
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
            if self.pauseView.isHidden == false {return}
            if self.timeLeft != 0 {
                self.timerLbl.text = "\(self.timeLeft) sec"
                self.timeLeft -= 1
                if self.timeLeft == 9 {Sounds.left10Sec.play()}
            } else {
                timer.invalidate()
                self.timerLbl.text = "Time is up..."
                self.noTimeLeft = true
                Sounds.noTimeLeft.play()
            }
        }
        
    }
    
}

