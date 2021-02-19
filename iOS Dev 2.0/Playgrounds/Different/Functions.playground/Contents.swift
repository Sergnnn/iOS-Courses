import UIKit

//  Shape 1

var length = 5
var width = 10

var area = length * width

//  Shape 2

var length2 = 6
var width2 = 12

var area2 = length2 * width2

//  Shape 3

var length3 = 3
var width3 = 8

var area3 = length3 * width3


//func calculateArea(length: Int, width: Int) -> Int {
//    let area = length * width
//    return area
//}

func calculateArea(length: Int, width: Int) -> Int {
    return length * width
    
}

let shape1 = calculateArea(length: 5, width: 4)
let shape2 = calculateArea(length: 6, width: 2)
let shape3 = calculateArea(length: 4, width: 4)



var bankAccountBalance = 500.00
var shoes = 350.00

//func purchaseItem(currentbalance: Double, itemPrice: Double) -> Double {
//    if itemPrice <= currentbalance{
//        print("Purchased item for: $\(itemPrice)")
//        return currentbalance - itemPrice
//    } else {
//        print("You are brokre")
//        return currentbalance
//    }
//}
//
//bankAccountBalance = purchaseItem(currentbalance: bankAccountBalance, itemPrice: shoes)
//
//var retroLunchbox = 40.00
//
//bankAccountBalance = purchaseItem(currentbalance: bankAccountBalance, itemPrice: retroLunchbox)




func purchaseItem(currentbalance: inout Double, itemPrice: Double) { // inout gives ability to modify variables, better not to use
    if itemPrice <= currentbalance{
        currentbalance = currentbalance - itemPrice
        print("Purchased item for: $\(itemPrice)")
        
    } else {
        print("You are brokre")
   
    }
}

purchaseItem(currentbalance: &bankAccountBalance, itemPrice: shoes)

var retroLunchbox = 40.00

purchaseItem(currentbalance: &bankAccountBalance, itemPrice: retroLunchbox)
