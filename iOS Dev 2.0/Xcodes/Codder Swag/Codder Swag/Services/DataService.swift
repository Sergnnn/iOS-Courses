//
//  DataService.swift
//  Codder Swag
//
//  Created by Сергей Непомящий on 12.01.2021.
//

import Foundation
class DataService {
    static let instance = DataService()
    
    private let categories = [
        Category(title: "SHIRTS", imageName: "shirts.png"),
        Category(title: "HOODIES", imageName: "hoodies.png"),
        Category(title: "HATS", imageName: "hats.png"),
        Category(title: "DIGITAL", imageName: "digital.png"),
    ]
    
    private let hats = [
        Product(title: "Devslopes Logo Graphic Beanie", price: "$18", imageName: "hat01.png"),
        Product(title: "Devslopes Logo Hat Black", price: "$22", imageName: "hat02.png"),
        Product(title: "Devslopes Logo Hat White", price: "$22", imageName: "hat03.png"),
        Product(title: "Devslopes Logo Snapback", price: "$20", imageName: "hat04.png")
    ]
    
    private let hoodies = [
        Product(title: "Devslopes Logo Hooide Grey", price: "$32", imageName: "hoodie01.png"),
        Product(title: "Devslopes Logo Hooide Red", price: "$32", imageName: "hoodie02.png"),
        Product(title: "Devslopes Hooide Grey", price: "$32", imageName: "hoodie03.png"),
        Product(title: "Devslopes Hooide Black", price: "$32", imageName: "hoodie04.png")
    ]
    
    private let shirts = [
        Product(title: "Devslopes Logo Shirt Black", price: "$32", imageName: "shirt01.png"),
        Product(title: "Devslopes Logo Shirt Grey", price: "$19", imageName: "shirt02.png"),
        Product(title: "Devslopes Shirt Red", price: "$12", imageName: "shirt03.png"),
        Product(title: "Devslopes Shirt Black", price: "$32", imageName: "shirt04.png"),
        Product(title: "Devslopes Shirt Studio", price: "$32", imageName: "shirt05.png")
    ]
    
    private let digitalGoods = [Product]()
    

    func getCategoris() -> [Category] {
        return categories
    }
    
    func getProducts(forCategoryTitle title:String) -> [Product] {
        switch title {
        case "SHIRTS":
          return  getShirts()
        case "HATS":
            return getHats()
        case "HOODIES":
            return  getHoodies()
        case "DIGITAL":
            return getDigitalGoods()
        default:
            return getShirts()
        }
    }
    
    
    func getHats() -> [Product] {
        return hats
    }
    func getHoodies() -> [Product] {
        return hoodies
    }
    func getShirts() -> [Product] {
        return shirts
    }
    func getDigitalGoods() -> [Product] {
        return digitalGoods
    }
}

