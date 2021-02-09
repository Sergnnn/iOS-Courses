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
    
        textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        font = UIFont(name: "Avenir", size: 15)
       
    }

}
