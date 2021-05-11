import Foundation

let path:String = "UDUDUDDDUUUUUUUDDDDDUDUDUDUU"
let steps:Int = path.count


func countingValleys2Passed(steps: Int, path: String) -> Int {
    let arrayOfPath = Array(path)
    var way = [Int](repeating: 0, count: steps + 2)
    var k = 0
    
    for i in 1...steps - 2{
        if arrayOfPath[i - 1] == "U"{
            way[i] += 1
            way[i+1] = way[i]
            } else {
                way[i] -= 1
                way[i+1] = way[i]
            }
    }
    for i in 0...steps {
        if way[i] == 0 && way[i + 1] == (-1) {
            k += 1
            }
    }
 return k
}
countingValleys2Passed(steps: steps, path: path)



func countingValleys(steps: Int, path: String) -> Int {
var newPath = path
let newSteps = steps

var arrayOfPath = [String]()
var arraytOfInt = [Int](repeating: 0, count: newSteps)
var way = [Int](repeating: 0, count: newSteps + 2)
var k = 0

for i in 0...newSteps - 1 {
    arrayOfPath.append("\(newPath.first!)")
    newPath.removeFirst()
    if arrayOfPath[i] == "U"{ arraytOfInt[i] = +1}
    else {arraytOfInt[i] = -1}
}

for i in 1...newSteps - 2 {
    way[i] += arraytOfInt[i - 1]
    way[i+1] = way[i]
}

for i in 0...way.count - 2 {
    if way[i] == 0 && way[i + 1] == (-1) {
        k += 1
    }
}
return k
}
