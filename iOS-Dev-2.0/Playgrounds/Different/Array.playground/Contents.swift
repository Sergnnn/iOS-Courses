import UIKit
var employee1Salary = 45000.0
var employee2Salary = 54000.0
var employee3Salary = 100000.0
var employee4Salary = 20000.0


var employeeSalaries: [Double] = [45000.0, 540000.0, 100000.0, 20000.0] // [Double] = Array<Double>

print(employeeSalaries.count)

employeeSalaries.append(39000.34)

print(employeeSalaries.count)

employeeSalaries.remove(at: 1) // index of array starts with 0

print(employeeSalaries.count)

var students = [String]() // empty Array of type String

print(students.count)

students.append("John")
students.append("Jacob")
students.append("Jose")
students.append("Jingle")
students.append("Heimer")
students.append("Smith")

students.remove(at: 2)
print(students)




