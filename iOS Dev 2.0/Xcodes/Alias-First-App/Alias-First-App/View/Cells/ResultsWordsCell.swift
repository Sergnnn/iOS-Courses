//
//  ResultsWordsCell.swift
//  Alias-First-App
//
//  Created by Сергей Непомящий on 12.02.2021.
//

import UIKit

protocol ResultsWordsCellDelegate {
    func didTapRefreshButton()
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
        if TFBtn.title(for: .normal) == "false" {
            TFBtn.setTitle("true", for: .normal)
            changeWordStatus(word: word.text!)
            results[0].score += 1
           
            print(results)
        } else {
            TFBtn.setTitle("false", for: .normal)
            changeWordStatus(word: word.text!)
            results[0].score -= 1
           
            print(results)
        }
        
        resultsWordsCellDelegate?.didTapRefreshButton()
    }
    
    func changeWordStatus(word: String) {
        for i in 0...results[0].words.count - 1 {
            if word == results[0].words[i] {
                results[0].wordIsCorrect[i] = !results[0].wordIsCorrect[i]
            }
        }
    }
    
}
