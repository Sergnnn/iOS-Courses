//
//  CustomTitleLable.swift
//  Alias-First-App
//
//  Created by Сергей Непомящий on 04.01.2021.
//

import UIKit

@IBDesignable
class CustomTitleLable: UILabel {

    override func prepareForInterfaceBuilder() {
        CustomTitleLable()
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        CustomTitleLable()
        
    }
    
    func CustomTitleLable() {
    
        textColor = #colorLiteral(red: 0.1251712918, green: 0.3118379438, blue: 0.2135035001, alpha: 1)
        font = UIFont(name: "Avenir", size: 22)
       

    }
}
