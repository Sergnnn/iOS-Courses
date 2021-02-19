import Foundation

var ar = [Int]()
var n = 9

ar = [10,20,20,10,10,30,50,10,20]

func sockMerchant2(n: Int, ar: [Int]) -> Int {
    let arUinque = Array(Set(ar))
    var amountOfPairs = 0

    for i in 0...arUinque.count - 1 {
        amountOfPairs += ar.filter({$0 == arUinque[i]}).count / 2
    }
    return amountOfPairs
}

sockMerchant2(n: n, ar: ar)

func sockMerchant(n: Int, ar: [Int]) -> Int {
    var arayForFunc = ar
    var k = 0
    var arOfUniqueNumbers = [Int]()
    var amountOfEachNumber = [Int]()
    var pairs = 0
    
    func getUniqueNumbers(array: [Int]) -> Array<Int> {
        var newArray = array
        var sen = [Bool]()
        for i in 0...newArray.count - 2 {
            if newArray[i] == newArray[i + 1]{
                sen.append(true)
            } else {sen.append(false)}
        }
        sen.append(false)
        for i in 0...newArray.count - 1 {
            k = n - 1 - i
            if sen[k] { newArray.remove(at: k)}
        }
        return newArray
    }
    
    arayForFunc = arayForFunc.sorted()
    
    arOfUniqueNumbers = getUniqueNumbers(array: arayForFunc)

    for i in 0...arOfUniqueNumbers.count - 1{
        amountOfEachNumber.append(0)
        for j in 0...ar.count - 1{
            if arOfUniqueNumbers[i] == ar[j] {
                amountOfEachNumber[i] += 1
            }
        }
    }
    
    print(amountOfEachNumber)
    
    for i in 0...amountOfEachNumber.count - 1{
        while (amountOfEachNumber[i] > 1) {
                if amountOfEachNumber[i] >= 2{
                    pairs += 1
                    amountOfEachNumber[i] -= 2
                }
        }
    }
    
return pairs
}
print(sockMerchant(n: n, ar: ar))




 
 
 //arOfUniqueNumbers = getUniqueNumbers(array: ar)
 /*
 for i in 0...arOfUniqueNumbers.count - 1{
     amountOfEachNumber.append(0)
     for j in 0...ar.count - 1{
         if arOfUniqueNumbers[i] == ar[j] {
             amountOfEachNumber[i] += 1
         }
     }
 }

 func getUniqueNumbers(array: [Int]) -> Array<Int> {
     var newArray = array
     var sen = [Bool]()
     for i in 0...newArray.count - 2 {
         if newArray[i] == newArray[i + 1]{
             sen.append(true)
         } else {sen.append(false)}
     }
     sen.append(false)
     for i in 0...newArray.count - 1 {
         k = n - 1 - i
         if sen[k] { newArray.remove(at: k)}
     }
     return newArray
 }
 print(amountOfEachNumber)

 for i in 0...amountOfEachNumber.count - 1{
     repeat { pairs += 1 ; amountOfEachNumber[i] -= 2}
     while amountOfEachNumber[i] > 1
 }
 print(pairs)


 */


