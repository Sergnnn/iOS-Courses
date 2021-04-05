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
    
        textColor = #colorLiteral(red: 0.9098187089, green: 0.3176635206, blue: 0.1137945428, alpha: 1)
        font = UIFont(name: "Avenir", size: 30)
       

    }

}
