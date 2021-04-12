//
//  CustomGlow.swift
//  Alias-First-App
//
//  Created by Сергей Непомящий on 10.04.2021.
//

import UIKit
@IBDesignable

class CustomGlow: UIImageView {
    



    override func prepareForInterfaceBuilder() {
        cglow()
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cglow()
        
    }
    
    func cglow() {
        let pulse : CAGradientLayer = {
                let l = CAGradientLayer()
                l.type = .radial
                l.colors = [ UIColor.green.cgColor,
                    UIColor.clear.cgColor]
                l.locations = [ 0, 1]
                l.startPoint = CGPoint(x: 0.5, y: 0.5)
                l.endPoint = CGPoint(x: 1, y: 1)
                layer.addSublayer(l)
                return l
            }()
        
        pulse.frame = bounds

    }

}
