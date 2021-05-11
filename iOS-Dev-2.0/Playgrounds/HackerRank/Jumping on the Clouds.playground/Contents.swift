import Foundation

let c = [0,1,0,1,0,1,0,0,0,0,0,0,0,0,1,0,1,0,0,0,0,1,0,1,0,0,1,0,0,0,1,0,1,0,0,0,1,0,1,0,1,
         0,1,0,0,0,1,0,0,0,0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,1,0,0,0,0,1,0,0,1,0,0,0,1,0,0,1,0,1,0]

func jumpingOnClouds(c: [Int]) -> Int {
    let c = c
    var k = 0
    var i = 0
    repeat{
        //if i == (c.count - 2) {break}
        if i <= c.count - 3 && c[i + 2] == 0 {i += 2; k += 1; print("Step \(k) - Long"); continue}
        if i <= c.count - 2 && c[i + 1] == 0 {i += 1; k += 1; print("Step \(k) - Short")}
        //else {break}
    } while i <= (c.count - 2)
    
    
    return k
}

print(jumpingOnClouds(c: c))

