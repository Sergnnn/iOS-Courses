//
//  CustomTextField.swift
//  ConverterApp
//
//  Created by Сергей Непомящий on 02.01.2021.
//

import UIKit


//@IBDesignable
class CustomTextField: UITextField {
/*
    override func prepareForInterfaceBuilder() { //change view in interfacebuilder
        customizeView()
    }
   */
    override func awakeFromNib() {
        super.awakeFromNib()
        customizeView()
    }
    
    func customizeView () {
        backgroundColor = #colorLiteral(red: 0.75, green: 0.75, blue: 0.75, alpha: 0.8)
        layer.cornerRadius = 5
        textAlignment = .center
        clipsToBounds = true
       
        
        if let p = placeholder {
            let place = NSAttributedString(string: p, attributes: [.foregroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) ])
            attributedPlaceholder = place
            textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }

}
