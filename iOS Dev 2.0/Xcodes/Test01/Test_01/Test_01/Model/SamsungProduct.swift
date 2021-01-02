//
//  SamsungProduct.swift
//  Test_01
//
//  Created by Сергей Непомящий on 25.12.2020.
//

import Foundation

class SamsungProduct {
    public private(set) var name: String
    public private(set) var color: String
    public private(set) var price: Double
    
    init (name:String, color:String,  price:Double) {
        self.name = name
        self.color = color
        self.price = price
        
    }
}

let samsungProduct = AppleProduct(name: "Samsung S20", color: "Black", price: 999.99)
