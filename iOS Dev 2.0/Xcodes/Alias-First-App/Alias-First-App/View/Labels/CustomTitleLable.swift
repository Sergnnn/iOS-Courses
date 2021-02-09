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
    
        textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        font = UIFont(name: "Avenir", size: 18)
       

    }
}
