//
//  CustomGuessedWords.swift
//  Alias-First-App
//
//  Created by Сергей Непомящий on 17.03.2021.
//

import Foundation
import UIKit

@IBDesignable
class CustomGuessedWords: UILabel {

    override func prepareForInterfaceBuilder() {
        CustomGuessedWords()
    }


    override func awakeFromNib() {
        super.awakeFromNib()
        CustomGuessedWords()
        
    }

    func CustomGuessedWords() {

        textColor = #colorLiteral(red: 0.1251712918, green: 0.3118379438, blue: 0.2135035001, alpha: 1)
        font = UIFont(name: "Avenir", size: 18)
       
    }
}
