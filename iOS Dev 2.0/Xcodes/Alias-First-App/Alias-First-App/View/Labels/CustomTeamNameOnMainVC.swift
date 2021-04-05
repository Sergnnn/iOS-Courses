//
//  CustomTeamNameOnMainVC.swift
//  Alias-First-App
//
//  Created by Сергей Непомящий on 11.02.2021.
//

import UIKit
@IBDesignable

class CustomTeamNameOnMainVC: CustomTitleLable {

    override func prepareForInterfaceBuilder() {
        CustomTitleLableColored()
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        CustomTitleLableColored()
        
    }
    
    func CustomTitleLableColored() {
        textColor = #colorLiteral(red: 0.9098187089, green: 0.3176635206, blue: 0.1137945428, alpha: 1)
    }

}
