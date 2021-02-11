//
//  CustomSubTitleLable.swift
//  Alias-First-App
//
//  Created by Сергей Непомящий on 05.01.2021.
//

import UIKit

@IBDesignable
class CustomSubTitleLable: UILabel {

    override func prepareForInterfaceBuilder() {
        CustomSubTitleLable()
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        CustomSubTitleLable()
        
    }
    
    func CustomSubTitleLable() {
    
        textColor = #colorLiteral(red: 0.1251712918, green: 0.3118379438, blue: 0.2135035001, alpha: 1)
        font = UIFont(name: "Avenir", size: 18)
       
    }

}
