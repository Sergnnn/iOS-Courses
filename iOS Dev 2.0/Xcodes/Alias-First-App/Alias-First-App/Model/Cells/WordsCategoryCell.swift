//
//  WordsCategoryCell.swift
//  Alias-First-App
//
//  Created by Сергей Непомящий on 29.01.2021.
//

import UIKit

protocol WordsCategoryCellDelegate {
    func buttonPressed(index: IndexPath)
}

class WordsCategoryCell: UICollectionViewCell {
    
    var indexPath: IndexPath?
    var wordsCategoryCellDelegate: WordsCategoryCellDelegate?

    @IBOutlet weak var wordsBtn: UIButton!
    
    func updateCell(word: word) {
        let image = UIImage(named: word.categoryImageName)
        wordsBtn.setTitle(nil, for: .normal)
        wordsBtn.setImage(image, for: .normal)
    }
    
     @IBAction func wordsBtnTapped(_ sender: Any) {
        wordsCategoryCellDelegate?.buttonPressed(index: indexPath!)
    }
    
}
