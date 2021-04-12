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
        layer.backgroundColor = #colorLiteral(red: 0.1251712918, green: 0.3118379438, blue: 0.2135035001, alpha: 0.25)
        setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) , for: .normal)
        titleLabel?.font = UIFont(name: "Avenir", size: 27)
    }
    
    
    

}
