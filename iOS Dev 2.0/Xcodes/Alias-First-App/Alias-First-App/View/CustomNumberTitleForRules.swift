//
//  CustomNumberTitleForRules.swift
//  Alias-First-App
//
//  Created by Сергей Непомящий on 05.01.2021.
//

import UIKit

@IBDesignable
class CustomNumberTitleForRules: UILabel {

    override func prepareForInterfaceBuilder() {
        CustomNumberTitleForRules()
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        CustomNumberTitleForRules()
        
    }
    
    func CustomNumberTitleForRules() {
    
        textColor = #colorLiteral(red: 0.9681761861, green: 0.7646607161, blue: 0.3817472458, alpha: 1)
        font = UIFont(name: "Avenir", size: 30)
       

    }

}
