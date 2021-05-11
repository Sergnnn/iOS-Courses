//
//  CharacterNameUIButton.swift
//  SWAPIApp
//
//  Created by Сергей Непомящий on 30.01.2021.
//

import UIKit

class CharacterNameUIButton: UIButton {

    override func prepareForInterfaceBuilder() {
        CharacterNameUIButton()
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        CharacterNameUIButton()
        
    }
    
    func CharacterNameUIButton() {
        setTitleColor(#colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1) , for: .normal)
        titleLabel?.font = UIFont(name: "Avenir", size: 20)
    }

}
