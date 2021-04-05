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
    
        textColor = #colorLiteral(red: 0.9098187089, green: 0.3176635206, blue: 0.1137945428, alpha: 1)
        font = UIFont(name: "Avenir", size: 35)
       

    }

}
