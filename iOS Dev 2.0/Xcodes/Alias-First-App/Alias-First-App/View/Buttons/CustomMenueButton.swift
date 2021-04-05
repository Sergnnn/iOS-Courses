//
//  CustomMenueButton.swift
//  Alias-First-App
//
//  Created by Сергей Непомящий on 16.02.2021.
//

import UIKit

@IBDesignable

class CustomMenueButton: CustomBackButton {

    override func prepareForInterfaceBuilder() {
        CustomMenueButtonF()
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        CustomMenueButtonF()
        
    }
    
    func CustomMenueButtonF() {
        let image = UIImage(systemName: "chevron.left")

        tintColor = #colorLiteral(red: 0.1251712918, green: 0.3118379438, blue: 0.2135035001, alpha: 1)
        setTitleColor(#colorLiteral(red: 0.1251712918, green: 0.3118379438, blue: 0.2135035001, alpha: 1) , for: .normal)
        titleLabel?.font = UIFont(name: "Avenir", size: 17)
        setImage(image, for: .normal)
        setTitle("Меню", for: .normal)
        
    }

}
