//
//  BorderButton.swift
//  Swoosh App
//
//  Created by Сергей Непомящий on 28.12.2020.
//

import UIKit

class BorderButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.borderWidth = 3.0
      //layer.borderColor = UIColor.white.cgColor
        layer.borderColor = #colorLiteral(red: 0.9727723002, green: 0.7644155025, blue: 0.3866758347, alpha: 1)
        layer.cornerRadius = 15
    }

}

