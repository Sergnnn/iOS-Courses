//
//  CustomTeamsButton.swift
//  Alias-First-App
//
//  Created by Сергей Непомящий on 04.01.2021.
//

import UIKit

@IBDesignable
class CustomTeamsButton: UIButton {

    override func prepareForInterfaceBuilder() {
        CustomTeamsButton()
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        CustomTeamsButton()
        
    }
    
    func CustomTeamsButton() {
        layer.backgroundColor = #colorLiteral(red: 0.9727723002, green: 0.7644155025, blue: 0.3866758347, alpha: 1)
        setTitleColor(#colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1) , for: .normal)
        titleLabel?.font = UIFont(name: "Avenir", size: 20)
    }
}
