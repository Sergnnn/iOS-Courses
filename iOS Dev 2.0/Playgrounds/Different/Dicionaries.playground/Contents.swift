

var namesOfIntegers = [Int: String]()

namesOfIntegers[3] = "three"
namesOfIntegers[44] = "forty four"

namesOfIntegers = [ : ]

var airports: [String: String] = ["YYZ": "toronto","LAX": "Los Angeles"]

print("The airports dictionry has: \(airports.count) items")
if airports.isEmpty {
    print("Airports dictionary is empty")
}

airports["LHR"] = "London"
airports["LHR"] = "heatrow"
airports["DEV"] = "Devslopes"

airports["DEV"] = nil
for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}

for key in airports.keys {
    print("Key: \(key)")
}

for val in airports.values {
    print("Value: \(val)")
}



