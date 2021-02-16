//
//  SeparatorLabelColor.swift
//  Alias-First-App
//
//  Created by Сергей Непомящий on 12.02.2021.
//

import UIKit
@IBDesignable

class SeparatorLabelColor: UILabel {

    override func prepareForInterfaceBuilder() {
        sparatorColor()
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        sparatorColor()
        
    }
    
    func sparatorColor() {
        self.backgroundColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
    }

}
