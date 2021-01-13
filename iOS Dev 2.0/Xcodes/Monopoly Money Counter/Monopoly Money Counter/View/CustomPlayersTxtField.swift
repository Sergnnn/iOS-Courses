//
//  CustomPlayersTxtField.swift
//  Monopoly Money Counter
//
//  Created by Сергей Непомящий on 09.01.2021.
//

import UIKit

@IBDesignable

class CustomPlayersTxtField: UITextField {

    override func prepareForInterfaceBuilder() {
        customizeView()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        customizeView()
    }
    
    func customizeView() {
        backgroundColor = #colorLiteral(red: 0.9959436059, green: 0.9896478057, blue: 1, alpha: 0.25)
        layer.cornerRadius = 15.0
        textAlignment = .center
        clipsToBounds = true
        textColor = #colorLiteral(red: 0.02392357588, green: 0.1488352716, blue: 0.4753955007, alpha: 1)
        font = UIFont(name: "Avenir-Lights", size: 18)
        
        if let p = placeholder {
            let place = NSAttributedString(string: p, attributes: [.foregroundColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)])
            attributedPlaceholder = place
            textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }

}
