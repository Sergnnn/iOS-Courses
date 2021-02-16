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

        setTitle("Menue", for: .normal)
        
    }

}
