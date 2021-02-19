import UIKit

var amITheBestTeacherEver: Bool = true

amITheBestTeacherEver = false


if true == false || true == true { // || - or operator
    print("WTFish")
}

var hasDataFinishedDownloading: Bool = 1 == 2
//...
//...

if !hasDataFinishedDownloading{ //    ! = not
    print("Loading data...")
}

hasDataFinishedDownloading = true
// Load UI and other app features


//Equal to: ==
//Not equal to: !=
//Greater than: >
//Greater than or euqal to : >=
//Less than or euqal to : <=

var bankBalance = 400
var itemToBuy = 100
if bankBalance >= itemToBuy {
    print ("purchased item")
}

if itemToBuy > bankBalance {
    print("You need more moeny")
}

if itemToBuy == bankBalance {
    print("balance now is 0")
}

var amIAtZero = itemToBuy == bankBalance

var bookTitle1 = "Harry Blotter and the Moppet of Mire"
var bookTitle2 = "Harry Blotter and the Moppet of Mire"

if bookTitle1 != bookTitle2 {
    print("need to fix spelling")
} else if bookTitle1.count > 10 {
    print("find a new  title for the book")
}
else {
    print("Book looks great send to printer")
}








