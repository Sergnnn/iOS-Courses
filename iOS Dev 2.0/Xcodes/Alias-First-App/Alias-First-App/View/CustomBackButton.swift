//
//  CustomBackButton.swift
//  Alias-First-App
//
//  Created by Сергей Непомящий on 04.01.2021.
//

import UIKit

@IBDesignable
class CustomBackButton: UIButton {

    override func prepareForInterfaceBuilder() {
        CustomBackButton()
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        CustomBackButton()
        
    }
    
    func CustomBackButton() {
    
        setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) , for: .normal)
        titleLabel?.font = UIFont(name: "Avenir", size: 15)
        
    }
    
}
