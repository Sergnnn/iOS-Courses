import UIKit

class Vehicle {
    var tires = 4
    var make: String?
    var model: String?
    var currentSpeed: Double = 0
    
    init() {
        print("I ma the parent")
    }
    
    func drive(speedInc: Double) {
        currentSpeed += speedInc * 2
    }
    
    func brake() {
        
    }
}

class Truck: Vehicle{
    override init() {
        super.init()
    }
    
    override func drive(speedInc: Double) {
        currentSpeed += speedInc
    }
    
}


class Sportscar: Vehicle {
   
    override init() {
        super.init()
        print("I am the child")
        make = "BMW"
        model = "3 series"
    }
    
    override func drive(speedInc: Double) {
        currentSpeed += speedInc * 3
    }
}

let car = Sportscar()
