//
//  CustomSwitch.swift
//  Alias-First-App
//
//  Created by Сергей Непомящий on 19.02.2021.
//

import UIKit

@IBDesignable
class CustomSwitch: UISwitch {

    override func prepareForInterfaceBuilder() {
            CS()
        }
        
        
    override func awakeFromNib() {
            super.awakeFromNib()
            CS()
            
        }
        
    func CS() {
        
          thumbTintColor = nil
    }
}
