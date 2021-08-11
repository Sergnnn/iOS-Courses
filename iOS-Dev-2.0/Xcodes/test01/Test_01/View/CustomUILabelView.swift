//
//  CustomUILabelView.swift
//  Test_01
//
//  Created by Сергей Непомящий on 25.12.2020.
//

import UIKit

class CustomUILabelView: UILabel {
    override func awakeFromNib() {
        textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        layer.cornerRadius = 10
        layer.shadowColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.75
        backgroundColor = #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
        layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        layer.borderWidth = 3

    }
}
