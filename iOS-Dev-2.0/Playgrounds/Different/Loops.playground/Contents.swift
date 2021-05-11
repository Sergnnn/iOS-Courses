import UIKit

//Bad Way
var employee1Salary = 45000.0
var employee2Salary = 100000.0
var employee3Salary = 54000.0
var employee4Salary = 20000.0

employee1Salary = employee1Salary * 1.1
employee2Salary = employee2Salary * 1.1
employee3Salary = employee3Salary * 1.1
employee4Salary = employee4Salary * 1.1

//Better Way

var salaries = [45000.0, 10000.0, 54000.0, 20000.0]
salaries[0] = salaries[0] * 1.1

//...

var index = 0

repeat { // what to repeat
    
    salaries[index] = salaries[index] * 1.1
    index+=1
    
} while (index < salaries.count) // condition



for i in 0..<salaries.count { // 0..<salaries.count range
    salaries[i] = salaries[i] * 1.1
}

for x in 0...3 { // inclusive
    print(salaries[x])
}

for x in 0..<4 { // esclusive
    print(salaries[x])
}

for salary in salaries {
    print("Salary:\(salary)")
}


