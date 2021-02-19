import UIKit

struct lettersAndNumbers {
    var letter: String
    var number1: Int
    var number2: Int
}

var array = [lettersAndNumbers]()
var newArray = [lettersAndNumbers]()


array.append(lettersAndNumbers(letter: "A", number1: 11, number2: 12))
array.append(lettersAndNumbers(letter: "B", number1: 21, number2: 22))
array.append(lettersAndNumbers(letter: "C", number1: 31, number2: 32))

print(array.description)

func getNewArray(letter: String) {
    for i in 0...array.count - 1 {
        if array[i].letter == letter {
            newArray.append(array[i])
        }
    }
}

getNewArray(letter: "A")
print(newArray)
