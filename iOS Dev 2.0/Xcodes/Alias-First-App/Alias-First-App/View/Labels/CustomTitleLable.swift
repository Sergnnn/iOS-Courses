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
    
        textColor = #colorLiteral(red: 0.1253850758, green: 0.3137430847, blue: 0.2117321789, alpha: 1)
        font = UIFont(name: "Avenir", size: 22)
       

    }
}
