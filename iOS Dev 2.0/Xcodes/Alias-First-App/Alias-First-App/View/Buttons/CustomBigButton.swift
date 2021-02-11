//
//  CustomBigButton.swift
//  Alias-First-App
//
//  Created by Сергей Непомящий on 04.01.2021.
//


import UIKit

@IBDesignable
class CustomBigButton: UIButton {

    override func prepareForInterfaceBuilder() {
        CustomBigButton()
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        CustomBigButton()
        
    }
    
    func CustomBigButton() {
        layer.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.2)
        layer.cornerRadius = 25.0
        setTitleColor(#colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1) , for: .normal)
        titleLabel?.font = UIFont(name: "Avenir-Medium", size: 22)
    }
    
    
    

}
