//
//  ResultsWordsCell.swift
//  Alias-First-App
//
//  Created by Сергей Непомящий on 12.02.2021.
//

import UIKit

protocol ResultsWordsCellDelegate {
    func didTapRefreshButton()
    func lastWordsAlertForTrue()
}

class ResultsWordsCell: UITableViewCell {

    @IBOutlet weak var word: UILabel!
    @IBOutlet weak var TFBtn: UIButton!
    var resultsWordsCellDelegate: ResultsWordsCellDelegate?
    
    func updateCell(wordIncmoing: String, tf: Bool) {
        word.text = wordIncmoing
        TFBtn.setTitle("\(tf)", for: .normal)
    }
    
    @IBAction func TFBtnPressed(_ sender: Any) {
        
        TFBtnCondition: if TFBtn.title(for: .normal) == "false" {
            
            if results.count == 1 {
                if word.text! == results[0].words[results[0].words.count - 1]{
                    resultsWordsCellDelegate?.lastWordsAlertForTrue()
                    TFBtn.setTitle("true", for: .normal)
                    generealTitleHandlign(bool: true)
                    print("BREAK!!!")
                    break TFBtnCondition
                }
            }
            
            TFBtn.setTitle("true", for: .normal)
            changeWordStatus(word: word.text!, bool: true)
            generealTitleHandlign(bool: true)
            
            //debugPrint("False tapped")
            debugPrint(results)
        } else {
            TFBtn.setTitle("false", for: .normal)
            changeWordStatus(word: word.text!,bool: false)
            changeLastWordStatus(words: word.text!, bool: false)
            generealTitleHandlign(bool: false)
            //debugPrint("True tapped")
            debugPrint(results)
        }
        
        Vibration.light.vibrate()
        resultsWordsCellDelegate?.didTapRefreshButton()
    }
    
    func changeWordStatus(word: String, bool: Bool) {
        if results.count == 1 {
            for i in 0...results[0].words.count - 1 {
                    if word == results[0].words[i] {results[0].wordIsCorrect[i] = !results[0].wordIsCorrect[i]; updateScore(index: 0)}
            }
        }
        if results.count == 2{
            if word == results[1].words[0] {results[1].wordIsCorrect[0] = !results[1].wordIsCorrect[0]; updateScore(index: 1)}
        }
        else{return}
        
    }
    
    func updateScore (index: Int){
        results[index].score = results[index].wordIsCorrect.filter({$0 == true}).count
    }
    
    func changeLastWordStatus(words:String, bool: Bool){
        if results.count == 2{
            if results[1].words[0] == words{
                if bool == true {
                    TFBtn.setTitle("true", for: .normal)
                }
            
                if bool == false {print("changeLastFalse")
                    TFBtn.setTitle("false", for: .normal)
                    results[0].wordIsCorrect.append(false)
                    results[0].words.append(results[1].words[0])
                    results.removeLast()
                }
            }
        }
    }
    
    func generealTitleHandlign(bool: Bool){
        if bool == true {
            if results.count == 1{
                if let index = (results[0].words[results[0].words.count - 1].range(of: "(")?.lowerBound) {
                    results[0].words[results[0].words.count - 1] = String(results[0].words[results[0].words.count - 1].prefix(upTo: index))
                }
            }
            if results.count == 2{
                if let index = (results[1].words[0].range(of: "(")?.lowerBound) {
                    results[1].words[0] = String(results[1].words[0].prefix(upTo: index))
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
