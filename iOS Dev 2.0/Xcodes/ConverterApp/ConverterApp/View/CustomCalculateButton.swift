//
//  CustomCalculateButton.swift
//  ConverterApp
//
//  Created by Сергей Непомящий on 02.01.2021.
//

import UIKit

//@IBDesignable
class CustomCalculateButton: UIButton {
    
    override func prepareForInterfaceBuilder() { //change view in interfacebuilder
        customizeView()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        customizeView()
    }
    
    
    func customizeView(){
        
        backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        layer.cornerRadius = 5.0
        clipsToBounds = true
        setTitle("Calculate in KM", for: .normal)
        
    }

}
