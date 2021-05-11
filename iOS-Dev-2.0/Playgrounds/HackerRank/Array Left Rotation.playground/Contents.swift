import UIKit

let a = [1,2,3,4,5]
let d = 4

func rotLeft(a: [Int], d: Int) -> [Int] {
    var newA = a
    if d == a.count {return newA}
        for _ in 1...d{
            newA.append(newA[0])
            newA.removeFirst()
        }
        return newA
}

print(rotLeft(a: a, d: d))

