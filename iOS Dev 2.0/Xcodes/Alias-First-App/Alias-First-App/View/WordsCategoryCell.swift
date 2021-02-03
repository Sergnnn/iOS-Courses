//
//  WordsCategoryCell.swift
//  Alias-First-App
//
//  Created by Сергей Непомящий on 29.01.2021.
//

import UIKit

class WordsCategoryCell: UICollectionViewCell {

    @IBOutlet weak var wordsCategoryName: UILabel!
    @IBOutlet weak var wordsCategoryImage: UIImageView!
    @IBOutlet weak var categoryIsEnable: UIImageView!
    
    
    func updateCell(word: word) {
        wordsCategoryName.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        wordsCategoryName.text = word.categoryName
        wordsCategoryImage.image = UIImage(named: word.categoryImageName)
        categoryIsEnable.isHidden = !word.categoryIsEnable
    }

}
