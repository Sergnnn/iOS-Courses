import UIKit

class Vehicle {
    var tires = 4
    var headlights = 2
    var hourspower = 468
    var model = ""
    
    func drive() {
        //accelerate the vehicle
    }
    
    func brake() {
        
    }
}

let bmw = Vehicle()
bmw.model = "328i"

let ford = Vehicle()
ford.model = "F150"
ford.brake()

func passByReference(vehicle: Vehicle) {
    vehicle.model = "Chees"
}

print(ford.model)

passByReference(vehicle: ford) //Pass by reference

print(ford.model)

func passByValue(age: Int){
    let newAge = age
}




