//
//  ConverterModel.swift
//  ConverterApp
//
//  Created by Сергей Непомящий on 02.01.2021.
//

import Foundation

class converter {
    
    class func roundUp2Dec (x:Double) -> Double {
        var y = x * 100
        y = Double(Int(y))
        y = y / 100
        return y
    }
    
    
    class func ConvertorMK (ConvertationType: String, Number: Double) -> Double{
        
        if ConvertationType == "km" {
            return roundUp2Dec(x: Number * 1.60934)
        } else if ConvertationType == "ml"{
            return roundUp2Dec(x: Number / 1.60934)
        } else if ConvertationType == "kg"{
            return roundUp2Dec(x: Number * 0.453592)
        } else  {
            return roundUp2Dec(x: Number / 0.453592)
        }
    }
}

