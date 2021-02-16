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
    
        textColor = #colorLiteral(red: 0.1251712918, green: 0.3118379438, blue: 0.2135035001, alpha: 1)
        font = UIFont(name: "Avenir", size: 35)
       

    }
}
