import UIKit

class Shape {
    
    func calcArea() -> Double{
        return 0.0
    }
    
    func calcPerimetr() -> Double{
        return 0.0
    }
}



class Triange: Shape {
    
    var sides: Double
    var height: Double
    
    override func calcArea() -> Double{
       return (sides * height / 2)
    }
    
    override func calcPerimetr() -> Double {
        return sides * 3
    }
    
    init(s: Double, h: Double) {
        self.sides = s
        self.height = h
    }
    
}

class Circle: Shape {
    
    var radius: Double
    
    override func calcArea() -> Double{
        return Double.pi * pow(radius,2)
        }
    
    override func calcPerimetr() -> Double {
        return 2 * Double.pi * radius
    }
    
    init(r: Double) {
        self.radius = r
    }
    
}

class Square: Shape {
    
    var side: Double
    
    override func calcArea() -> Double{
       return pow(side,2)
    }
    
    override func calcPerimetr() -> Double {
        return side * 4
    }
    
    init(s:Double) {
        self.side = s
    }
}

var trinagle1 = Triange(s: 10, h: 12)
print("Triangle area: \(trinagle1.calcArea())")
print("Triangle perimetr: \(trinagle1.calcPerimetr())\n")

var circle1 = Circle(r: 5)
print("Circle area: \(circle1.calcArea())")
print("Circle perimetr: \(circle1.calcPerimetr())\n")

var square1 = Square(s: 10)
print("Square area: \(square1.calcArea())")
print("Square perimetr: \(square1.calcPerimetr())\n")



