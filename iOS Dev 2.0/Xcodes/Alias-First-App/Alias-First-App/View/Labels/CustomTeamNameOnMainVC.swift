//
//  CustomTeamNameOnMainVC.swift
//  Alias-First-App
//
//  Created by Сергей Непомящий on 11.02.2021.
//

import UIKit

class CustomTeamNameOnMainVC: CustomTitleLable {

    override func prepareForInterfaceBuilder() {
        CustomTitleLableColored()
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        CustomTitleLableColored()
        
    }
    
    func CustomTitleLableColored() {
        textColor = #colorLiteral(red: 0.8515639305, green: 0, blue: 0.2817598879, alpha: 1)
    }

}
