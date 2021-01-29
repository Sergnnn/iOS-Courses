//
//  UIButtonExt.swift
//  GoalPost
//
//  Created by Сергей Непомящий on 23.01.2021.
//

import UIKit

extension UIButton {
    
    func setSelectedColor() {
        self.backgroundColor = #colorLiteral(red: 1, green: 0.7102703452, blue: 0.4166283011, alpha: 1)
    }
    
    func setDeselectedColor() {
        self.backgroundColor = #colorLiteral(red: 1, green: 0.5893468857, blue: 0.5156106353, alpha: 1)
    }
}
