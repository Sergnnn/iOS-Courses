//
//  CustomWinnerLabel.swift
//  Alias-First-App
//
//  Created by Сергей Непомящий on 16.02.2021.
//

import UIKit
@IBDesignable

class CustomWinnerLabel: UILabel {

    override func prepareForInterfaceBuilder() {
        winnerLabel()
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        winnerLabel()
        
    }
    
    func winnerLabel() {
    
        textColor = #colorLiteral(red: 0.8515639305, green: 0, blue: 0.2817598879, alpha: 1)
        font = UIFont(name: "Avenir", size: 35)
       

    }

}
