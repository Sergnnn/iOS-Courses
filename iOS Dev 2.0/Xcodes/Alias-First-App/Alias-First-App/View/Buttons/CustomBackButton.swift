//
//  CustomBackButton.swift
//  Alias-First-App
//
//  Created by Сергей Непомящий on 04.01.2021.
//

import UIKit

@IBDesignable
class CustomBackButton: UIButton {

    override func prepareForInterfaceBuilder() {
        CustomBackButton()
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        CustomBackButton()
        
    }
    
    func CustomBackButton() {
        
        let image = UIImage(systemName: "chevron.left")

        tintColor = #colorLiteral(red: 0.1251712918, green: 0.3118379438, blue: 0.2135035001, alpha: 1)
        setTitleColor(#colorLiteral(red: 0.1251712918, green: 0.3118379438, blue: 0.2135035001, alpha: 1) , for: .normal)
        titleLabel?.font = UIFont(name: "Avenir", size: 17)
        setImage(image, for: .normal)
        setTitle("Back", for: .normal)
        
    }
    
}
