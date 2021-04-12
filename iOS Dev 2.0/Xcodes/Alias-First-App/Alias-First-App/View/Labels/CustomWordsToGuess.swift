//
//  CustomWordsToGuess.swift
//  Alias-First-App
//
//  Created by Сергей Непомящий on 12.02.2021.
//

import UIKit

@IBDesignable

class CustomWordsToGuess: CustomTitleLable {
    
    override func prepareForInterfaceBuilder() {
        WordsToGuess()
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        WordsToGuess()
        
    }
    
    func WordsToGuess() {
        textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        font = UIFont(name: "Avenir-Heavy", size: 35)

    }
}
