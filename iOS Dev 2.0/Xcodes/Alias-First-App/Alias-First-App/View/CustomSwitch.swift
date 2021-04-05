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
        onTintColor = #colorLiteral(red: 0.9098187089, green: 0.3176635206, blue: 0.1137945428, alpha: 1)
    }
}
