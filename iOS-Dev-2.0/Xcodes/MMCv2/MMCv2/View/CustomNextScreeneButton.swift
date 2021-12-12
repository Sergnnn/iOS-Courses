//
//  CustomNextScreeneButton.swift
//  MMCv2
//
//  Created by Serg Nepomyaschyy on 12.12.2021.
//

import UIKit

@IBDesignable

class CustomNextScreeneButton: UIButton {

    override func prepareForInterfaceBuilder() {
        CustomNextScreeneButton()
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        CustomNextScreeneButton()
        
    }
    
    func CustomNextScreeneButton() {
        layer.backgroundColor = #colorLiteral(red: 0.9959436059, green: 0.9896478057, blue: 1, alpha: 0.25)
        layer.cornerRadius = 20.0
        setTitleColor(#colorLiteral(red: 0.02392357588, green: 0.1488352716, blue: 0.4753955007, alpha: 1) , for: .normal)
        titleLabel?.font = UIFont(name: "Avenir-Heavy", size: 20)
    }

}
