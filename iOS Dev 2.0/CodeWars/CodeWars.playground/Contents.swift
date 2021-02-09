import UIKit



func reverseSeq(n: Int) -> [Int] {
   var arr = [Int]()
    for i in 1...n {
        arr.append(i)
    }
    arr.reverse()
  return arr
}



func expandedForm(_ num: Int) -> String {
    var StrNum = String(num)
    let k = StrNum.count
    var result = ""
    var i = 0

    repeat {

        i += 1
        print(i)
        print(StrNum)
        if (Int("\(String(StrNum.first!))")! * Int(pow(10, StrNum.count - 1).description)!) == 0 {
            StrNum.removeFirst()
        }else {
        result = result + " + \(Int("\(String(StrNum.first!))")! * Int(pow(10, StrNum.count - 1).description)!)"
        StrNum.removeFirst()
        }
    } while i < k
    result.removeFirst()
    result.removeFirst()
    result.removeFirst()
 return result
}

expandedForm(1034)


func switchItUp(_ number: Int) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = NumberFormatter.Style.spellOut
    return formatter.string(for: number)!.capitalized
}

switchItUp(2)

func sumMix(_ arr: [Any]) -> Int {
//    var k = 0
//    for i in 0...arr.count - 1 {
//        k += Int("\(arr[i])")!
//    }
//    return k
    return arr.reduce(0) { $0 + (Int("\($1)") ?? 0) }
}

sumMix(["5", "0", 9, 3, 2, 1, "9", 6, 7])




