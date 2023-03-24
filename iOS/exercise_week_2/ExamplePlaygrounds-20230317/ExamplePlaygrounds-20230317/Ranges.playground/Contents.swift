import UIKit

let months = 1...12
let monthDays = 1...31
let unixYears = 1970..<2038

var output = "Valid months are: "
for m in months {
    output += "\(m) "
}
print(output)

output = "Valid days are: "
for d in monthDays {
    output += "\(d) "
}
print(output)
