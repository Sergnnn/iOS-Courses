import UIKit

let s = "abacb"
let n = 14

func repeatedString2(s: String, n: Int) -> Int {
    let lastLetters = n % s.count
    let repeatedWords: Int = n / s.count
    let lastString = s.substring(to: String.Index(encodedOffset: lastLetters)).filter({$0 == "a"}).count

    return s.filter({$0 == "a"}).count * repeatedWords + lastString
}

func repeatedString(s: String, n: Int) -> Int {
    let s = Array(s)
    var sAr = [String.Element]()
    var k = 0
    
    for _ in 0...n - 1 {
        if k == s.count {k = 0}
        sAr.append(s[k])
        k += 1
    }
return sAr.filter({$0 == "a"}).count
}

repeatedString(s: s, n: n)
repeatedString2(s: s, n: n)

