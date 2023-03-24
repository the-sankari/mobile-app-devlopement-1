import UIKit
import Foundation

let today = Date()
let calendar = Calendar.current

var birthDateComponents = DateComponents()
birthDateComponents.year = 1997
birthDateComponents.month = 8
birthDateComponents.day = 16
let birthDate = calendar.date(from: birthDateComponents)!

let age = calendar.dateComponents([.day], from: birthDate, to:today)

print(age.day!)
