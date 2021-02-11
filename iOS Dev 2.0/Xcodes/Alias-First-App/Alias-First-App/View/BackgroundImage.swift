//
//  BackgroundImage.swift
//  Alias-First-App
//
//  Created by Сергей Непомящий on 11.02.2021.
//

import UIKit


class BackgroundImage: UIImageView {
     override func awakeFromNib() {
            super.awakeFromNib()
            CustomBG()
        }
        func CustomBG() {
            self.image = UIImage(named: "BG2")
        }

}
