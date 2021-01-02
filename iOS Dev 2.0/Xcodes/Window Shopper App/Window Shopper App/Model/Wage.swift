//
//  Wage.swift
//  Window Shopper App
//
//  Created by Сергей Непомящий on 02.01.2021.
//

import Foundation

class Wage {
    class func getHours (forWage wage: Double, andPrice price: Double) -> Int {
        return Int(ceil(price/wage))
    }
}
