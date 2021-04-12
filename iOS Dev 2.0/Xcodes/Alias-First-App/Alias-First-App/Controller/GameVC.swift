//
//  GameVC.swift
//  Alias-First-App
//
//  Created by Сергей Непомящий on 09.02.2021.
//

import UIKit
import AVFoundation
import CoreData

class GameVC: UIViewController {
// MARK: - Variables
    var timer: Timer?
    var timeLeft: Int = rules.roundTime
    var noTimeLeft: Bool = false
    var pauseTime: Int = 0
    
    @IBOutlet weak var timerLbl: UILabel!
    @IBOutlet weak var scoreOfTheRoundLbl: UILabel!
    @IBOutlet weak var wordToGuess: UILabel!
    @IBOutlet weak var pauseView: UIView!
    @IBOutlet weak var glow: UIImageView!
    
    
    
    
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
        glow(true)
        roundScoreCounter(true, minus: rules.minusWord)
        setScoreOfTheRoundLbl()
        results[0].words.append(wordToGuess.text!)
        results[0].wordIsCorrect.append(true)
        results[0].score = scoreOfTheRound
        wordToGuess.text = getRandomWordAndRemoveIt()
        Vibration.success.vibrate()
        Sounds.correctWord.play(OnOff: rules.soundInGame)
        debugPrint(results)
        
        if noTimeLeft {
            wordToGuess.isHidden = true
            showAlert(generalWord: rules.generalWord)
        }
    }
    @IBAction func unCorrectBtn(_ sender: Any) {
        glow(false)
        roundScoreCounter(false, minus: rules.minusWord)
        setScoreOfTheRoundLbl()
        results[0].words.append(wordToGuess.text!)
        results[0].wordIsCorrect.append(false)
        results[0].score = scoreOfTheRound
        wordToGuess.text = getRandomWordAndRemoveIt()
        Vibration.error.vibrate()
        Sounds.unCorrectWord.play(OnOff: rules.soundInGame)
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
        
    func showAlert(generalWord: Bool) {
        if generalWord {
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
        else { self.performSegue(withIdentifier: "ResultsVC", sender: nil)}
        }

    func addGeneralWord(teamName: String) {
        if results[0].team != teamName {
            results.append(result(team: teamName, score: 1, words: ["\(results[0].words.last!)(\(teamName))"], wordIsCorrect: [true]))
            results[0].score -= 1
            results[0].wordIsCorrect.removeLast()
            results[0].words.removeLast()
        }
    }


// MARK: - Functions
    func setScoreOfTheRoundLbl() {
        scoreOfTheRoundLbl.text = String(scoreOfTheRound)
    }
    
    func roundScoreCounter(_ tf: Bool, minus: Bool){
        if minus == false {
            if tf {scoreOfTheRound += 1}
                else {
                    if scoreOfTheRound == 0 {scoreOfTheRound = 0}
                    else {return}
                }
        } else {
            if tf {scoreOfTheRound += 1}
                else {scoreOfTheRound -= 1}
        }
    }
    
// MARK: - Glow effect
    func glow(_ bool: Bool){
        let colorBase = #colorLiteral(red: 0.1251712918, green: 0.3118379438, blue: 0.2135035001, alpha: 0.2549976071)
        let colorTrue = #colorLiteral(red: 0.04668927852, green: 0.810528996, blue: 0.07704036889, alpha: 0.2470848639)
        let colorFalse = #colorLiteral(red: 0.9098187089, green: 0.3176635206, blue: 0.1137945428, alpha: 0.2493702465)
        
        if bool {
            glow.backgroundColor = colorTrue
            UIView.animate(withDuration: 0.25) {
                self.glow.backgroundColor = colorBase
            }
        }
        else {
            glow.backgroundColor = colorFalse
            UIView.animate(withDuration: 0.25) {
                self.glow.backgroundColor = colorBase
            }
        }
    }
    

        
// MARK: - Timer
    func setupTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            if self.pauseView.isHidden == false {return}
            if self.timeLeft != 0 {
                self.timerLbl.text = "\(self.timeLeft)"
                self.timeLeft -= 1
                if self.timeLeft == 9 {Sounds.left10Sec.play(OnOff: rules.soundInGame)}
            } else {
                timer.invalidate()
                self.timerLbl.text = ""
                let image: UIImage = UIImage(named: "hourglass")!
                var bgImage: UIImageView?
                bgImage = UIImageView(image: image)
                bgImage!.frame = CGRect(x: 0,y: -20,width: 40,height: 40)
                self.timerLbl.addSubview(bgImage!)
                
                self.noTimeLeft = true
                Sounds.noTimeLeft.play(OnOff: rules.soundInGame)
            }
        }
        
    }
    
}

