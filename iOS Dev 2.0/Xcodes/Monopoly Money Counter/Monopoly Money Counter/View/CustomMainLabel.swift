//
//  CustomMainLabel.swift
//  Monopoly Money Counter
//
//  Created by Сергей Непомящий on 09.01.2021.
//

import UIKit

@IBDesignable
class CustomMainLabel: UILabel {

    override func prepareForInterfaceBuilder() {
        CustomMainLable()
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        CustomMainLable()
        
    }
    
    func CustomMainLable() {
    
        textColor = #colorLiteral(red: 0.02392357588, green: 0.1488352716, blue: 0.4753955007, alpha: 1)
        font = UIFont(name: "Avenir-Heavy", size: 20)
        
       

    }

}
