//
//  CustomTeamVCLabel.swift
//  Alias-First-App
//
//  Created by Сергей Непомящий on 12.02.2021.
//

import UIKit
@IBDesignable

class CustomTeamVCLabel: UILabel {

    override func prepareForInterfaceBuilder() {
        TeamVCLabel()
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        TeamVCLabel()
        
    }
    
    func TeamVCLabel() {
    
        textColor = #colorLiteral(red: 0.02392357588, green: 0.1488352716, blue: 0.4753955007, alpha: 1)
        font = UIFont(name: "Avenir", size: 22)
       

    }
    
}
