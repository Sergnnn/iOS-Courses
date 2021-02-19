import UIKit

var date1: Date = Date()

let date2 = Date(timeIntervalSinceNow: 12600) // 3:30

let diff = Int(date2.timeIntervalSince1970 - date1.timeIntervalSince1970)

let hours = diff / 3600
let minutes = (diff - hours * 3600) / 60
