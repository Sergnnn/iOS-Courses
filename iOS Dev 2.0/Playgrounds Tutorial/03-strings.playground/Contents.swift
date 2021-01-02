import UIKit

/*:
 ### Code Example
 */

var fullName = "John Smith" // Type inference

var message: String = "Hey there!" // Explicit type declaration
print(message)

let firstName = "Jenna"
let lastName = "Smith"

fullName = firstName + " " + lastName
print(fullName)

var age = 20

var newMessage = "Hi, my name is \(firstName) and I am \(age) years old" // String interpolation
print(newMessage)

newMessage.append(". And I like clowns.")
print(newMessage)

/*:
 ### Exercise
 
 Create a series of variables and constants that represent a driver's license or passport.  You might include properies such as:
 
 1.  dateOfBirth
 2.  age
 3.  isOrganDonor
 4.  streetAddress
 5.  city
 6.  state
 7.  zip / postal code
 8.  idNumber
 9. etc
 
 After you have created the properties, create a string variable that contains all of the data from the other variables/constants and then print it into a single readable sentance.
 
 The final output might look similar to this:  "Hi, my name is Jill and I was born on 12/20/80 and I live at 224 Worthington drive and my id number is..." etc etc
 
 Be sure to include all of the properties.
 */
let dateOfBirth = "12/20/80"
var ageEx = 40
var isOrganDonor = "Yes"
var streetAddress = "224 Worthington drive"
var city = "New York"
var state = "NY"
var zip = "888"
var idNumber = "123"

let sentace = "Hi, my name is Jill and I am \(ageEx) years old and I was born on \(dateOfBirth). I live in \(city) state \(state), at \(streetAddress), zipcode is \(zip). My ID number is \(idNumber). Could I be a organ donor? \(isOrganDonor)."
print(sentace)
