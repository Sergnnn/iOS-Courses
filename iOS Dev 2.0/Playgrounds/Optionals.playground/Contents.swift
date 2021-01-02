import UIKit

/*
struct Person {
    let firstName: String
    let middleName: String?
    let lastName: String


    func printFullName()    {
        let middle = middleName ?? ""
        
//        if middleName == nil {
//            middle = ""
//        }
        
    print(" \(firstName) \(middle) \(lastName) ")
    }
}


var person1 = Person(firstName: "Jenna", middleName: nil, lastName: "Smith")
var person2 = Person(firstName: "Bob", middleName: "Leroy", lastName: "Jenkins")

person1.printFullName()
person2.printFullName()

*/

class Person {
    let firstName: String
    let middleName: String?
    let lastName: String
    let spouse: Person?

    init(firstname: String, middleName: String?, lastName: String, spouse: Person?){
        self.firstName = firstname
        self.middleName = middleName
        self.lastName = lastName
        self.spouse = spouse
    }

    func getFullName() ->String {
        let middle = middleName ?? ""
    return " \(firstName) \(middle) \(lastName) "
    }
}

let person = Person(firstname: "Kimbo", middleName: "Joe", lastName: "Slice", spouse: nil)


if let spouseName = person.spouse?.getFullName() {
    print(spouseName)
} else {
    print("\(person.firstName) does not have a spouse")
}

//Use this
print(person.spouse?.getFullName() ?? "\(person.firstName) does not have a spouse")

//Do not do this
//print(person.spouse!.getFullName())

