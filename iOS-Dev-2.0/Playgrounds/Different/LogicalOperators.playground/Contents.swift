import UIKit

// Logical NOT operator - unary prefix oeprator

let allowdEntry = false

if  !allowdEntry { // != true - teh same
    print("Access Denied")
}

let enteredDoorCode = true
let passedRetinaScan = false
let iAmTom = false

if enteredDoorCode && passedRetinaScan || iAmTom {
    print("Welcome")
} else {
    print("Access Denied")
}

let hasDoorKey = false
let knowsOverridePassword = true

if hasDoorKey || knowsOverridePassword {
    print("Welcome")
} else {
    print("Denied")
}


