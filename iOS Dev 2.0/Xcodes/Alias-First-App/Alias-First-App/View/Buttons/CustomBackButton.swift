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

        tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) , for: .normal)
        titleLabel?.font = UIFont(name: "Avenir", size: 17)
        setImage(image, for: .normal)
        setTitle("Back", for: .normal)
        
    }
    
}
