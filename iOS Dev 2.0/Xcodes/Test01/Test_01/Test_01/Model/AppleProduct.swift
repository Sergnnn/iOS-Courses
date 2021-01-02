//
//  AppleProduct.swift
//  Test_01
//
//  Created by Сергей Непомящий on 24.12.2020.
//

import Foundation

class AppleProduct {
    public private(set) var name: String
    public private(set) var color: String
    public private(set) var price: Double
    
    init (name:String, color:String,  price:Double) {
        self.name = name
        self.color = color
        self.price = price
        
    }
}

let appleProduct = AppleProduct(name: "iPhone X", color: "Space Gray", price: 999.99)

