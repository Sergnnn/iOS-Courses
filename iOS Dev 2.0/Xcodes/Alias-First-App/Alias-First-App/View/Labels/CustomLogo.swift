//
//  CustomLogo.swift
//  Alias-First-App
//
//  Created by Сергей Непомящий on 01.04.2021.
//

import UIKit
@IBDesignable

class CustomLogo: UILabel {

    override func prepareForInterfaceBuilder() {
        logo()
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        logo()
        
    }
    
    func logo() {
        self.attributedText = NSMutableAttributedString(string: "Alias",
        attributes: stroke(font: UIFont(name: "Avenir-Heavy", size: 72)!,
                           strokeWidth: 3, insideColor: .clear, strokeColor: #colorLiteral(red: 0.1253850758, green: 0.3137430847, blue: 0.2117321789, alpha: 1)))
    }

}


