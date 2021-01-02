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


/*:
 ### Exercise
 
 Consider some basic American traffic signaling.
 
 1.  Create a string variable called `currentLightColor`
 2.  Set it's value to "Green", "Yellow", or "Red"
 3.  Create conditional if / else logic to print: "The light is X" where X is the value of the light variable
 4.  If if /else clause should print the appropriate color
 */


var currentLightColor = "Red"

if currentLightColor == "Green" {
    print ("The light is Green")
} else
if currentLightColor == "Yellow" {
    print("The light is Yellow")
} else
if currentLightColor == "Red" {
    print("The light is Red")
}

