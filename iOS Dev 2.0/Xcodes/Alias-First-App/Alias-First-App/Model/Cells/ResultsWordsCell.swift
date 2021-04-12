//
//  ResultsWordsCell.swift
//  Alias-First-App
//
//  Created by Сергей Непомящий on 12.02.2021.
//

import UIKit

protocol ResultsWordsCellDelegate {
    func didTapRefreshButton()
    func lastWordsAlertForTrue(generalWordRule: Bool, minusRule: Bool)
}

class ResultsWordsCell: UITableViewCell {
    
    let imageTickT = UIImage(named: "tickT")
    let imageTickF = UIImage(named: "tickF")

    @IBOutlet weak var word: UILabel!
    @IBOutlet weak var TFBtn: UIButton!
    var resultsWordsCellDelegate: ResultsWordsCellDelegate?
    
    func updateCell(wordIncmoing: String, tf: Bool) {
        word.text = wordIncmoing
        TFBtn.setTitle(nil, for: .normal)
        setTitleImageFromBool(tf: tf)
    }
    
    @IBAction func TFBtnPressed(_ sender: Any) {
        
        TFBtnCondition: if TFBtn.image(for: .normal) == imageTickF {
            
            if results.count == 1 {
                if word.text! == results[0].words[results[0].words.count - 1]{
                    resultsWordsCellDelegate?.lastWordsAlertForTrue(generalWordRule: rules.generalWord, minusRule: rules.minusWord)
                    TFBtn.setTitle("true", for: .normal)
                    generealTitleHandlign(bool: true, rules: rules.generalWord)
                    break TFBtnCondition
                }
            }
            
            TFBtn.setTitle("true", for: .normal)
            changeWordStatus(word: word.text!, bool: true)
            generealTitleHandlign(bool: true, rules: rules.generalWord)
            
            debugPrint("False tapped")
            debugPrint(results)
        } else {
            TFBtn.setTitle("false", for: .normal)
            changeWordStatus(word: word.text!,bool: false)
            changeLastWordStatus(words: word.text!, bool: false)
            generealTitleHandlign(bool: false, rules: rules.generalWord)
            debugPrint("True tapped")
            debugPrint(results)
        }
        
        Vibration.light.vibrate()
        resultsWordsCellDelegate?.didTapRefreshButton()
    }
    
    func changeWordStatus(word: String, bool: Bool) {
        if results[0].words.count == 0 { if word == results[1].words[0] {results[1].wordIsCorrect[0] = !results[1].wordIsCorrect[0]; updateScore(index: 0, minusRule: rules.minusWord)}}
        else{
            for i in 0...results[0].words.count - 1 {
                        if word == results[0].words[i] {results[0].wordIsCorrect[i] = !results[0].wordIsCorrect[i]; updateScore(index: 0, minusRule: rules.minusWord)}
                }
            if results.count == 2{
                if word == results[1].words[0] {results[1].wordIsCorrect[0] = !results[1].wordIsCorrect[0]; updateScore(index: 1, minusRule: rules.minusWord)}
            }
            else{return}
        }
    }
    
    func setTitleImageFromBool (tf:Bool) {
        if tf {TFBtn.setImage(imageTickT, for: .normal); TFBtn.tintColor = #colorLiteral(red: 0.1253850758, green: 0.3137430847, blue: 0.2117321789, alpha: 1)}
        else {TFBtn.setImage(imageTickF, for: .normal); TFBtn.tintColor = #colorLiteral(red: 0.9098187089, green: 0.3176635206, blue: 0.1137945428, alpha: 1)}
    }
    
    func updateScore (index: Int, minusRule: Bool){
        if minusRule == false {results[index].score = results[index].wordIsCorrect.filter({$0 == true}).count}
        else {
            debugPrint("UpdateScore")
            results[index].score = results[index].wordIsCorrect.filter({$0 == true}).count - results[index].wordIsCorrect.filter({$0 == false}).count
            if results[0].wordIsCorrect.last == false {results[0].score += 1}
        }
    }
    
    //ADD UPDATE SCORE TO CHANGE LAST WORD STATUS
    func changeLastWordStatus(words:String, bool: Bool){
        if results.count == 2{
            if results[1].words[0] == words{
                if bool == true {
                    TFBtn.setTitle("true", for: .normal)
                }
            
                if bool == false {debugPrint("changeLastFalse")
                    TFBtn.setTitle("false", for: .normal)
                    results[0].wordIsCorrect.append(false)
                    results[0].words.append(results[1].words[0])
                    results.removeLast()
                }
            }
        }
    }
    
    func generealTitleHandlign(bool: Bool, rules: Bool){
        if rules == false {return}
            else {
                if bool == true {
                    if results.count == 1{
                        if let index = (results[0].words[results[0].words.count - 1].range(of: "(")?.lowerBound) {
                            results[0].words[results[0].words.count - 1] = String(results[0].words[results[0].words.count - 1].prefix(upTo: index))
                        }
                    }
                    
                    if results.count == 2{
                        if word.text! == results[1].words[0] {results[1].words[0] = "\(results[1].words[0])(Общее)"}
                    }
                }
                if bool == false {
                    if results.count == 1{
                        if word.text! == results[0].words[results[0].words.count - 1] {
                            if let index = (results[0].words[results[0].words.count - 1].range(of: "(")?.lowerBound) {
                                results[0].words[results[0].words.count - 1] = String(results[0].words[results[0].words.count - 1].prefix(upTo: index))
                            }
                            results[0].words[results[0].words.count - 1] = "\(results[0].words[results[0].words.count - 1])(Общее)"
                        }
                    }
                    
                    if results.count == 2{
                        if word.text! == results[1].words[0] {
                            if let index = (results[1].words[0].range(of: "(")?.lowerBound) {
                                results[1].words[0] = String(results[1].words[0].prefix(upTo: index))
                            }
                            results[1].words[0] = "\(results[1].words[0])(Общее)"}
                    }
                }
        }
    }
}

