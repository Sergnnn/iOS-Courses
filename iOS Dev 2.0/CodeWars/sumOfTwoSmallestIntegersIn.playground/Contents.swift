import UIKit

func sumOfTwoSmallestIntegersIn(_ array: [Int]) -> Int {
  
//    var ar = array
//    var a = array.min()!
//    var k = 0
//
//
//    for i in 0...array.count - 1 {
//        if array[i] == array.min() {
//            k = i
//        }
//    }
//    ar.remove(at: k)
//    a += ar.min()!
//
//    return a
    let sort = array.sorted()
    return sort[0] + sort[1]
}


sumOfTwoSmallestIntegersIn([5, 8, 12, 18, 22])
