//
//  CustomTeamsButton.swift
//  Alias-First-App
//
//  Created by Сергей Непомящий on 04.01.2021.
//

import UIKit

@IBDesignable
class CustomNextButton: UIButton {

    override func prepareForInterfaceBuilder() {
        CustomTeamsButton()
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        CustomTeamsButton()
        
    }
    
    func CustomTeamsButton() {
        layer.backgroundColor = #colorLiteral(red: 0.1251712918, green: 0.3118379438, blue: 0.2135035001, alpha: 0.2549976071)
        setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) , for: .normal)
        setTitle("Играть", for: .normal)
        titleLabel?.font = UIFont(name: "Avenir", size: 27)
    }
}
