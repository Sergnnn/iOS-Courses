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
    
        textColor = #colorLiteral(red: 0.1253850758, green: 0.3137430847, blue: 0.2117321789, alpha: 1)
        font = UIFont(name: "Avenir", size: 22)
       

    }
    
}
