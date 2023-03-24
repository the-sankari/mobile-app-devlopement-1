import UIKit

var greeting = "Hello, world!"

greeting.count

greeting += " It's a nice day."

let s1 = "Swift"
let s2 = "SwiftUI"

if s1 == s2 {
    print("\(s1) is the same as \(s2)")
}
else {
    print("\(s1) is not the same as \(s2)")
}

var spaceCount = 0
for c in greeting {
    if c == " " {
        spaceCount += 1
    }
}

"The greeting has \(spaceCount) spaces."

greeting
let worldLength = "world".count

let worldStart = greeting.index(greeting.startIndex, offsetBy: 7)
let worldEnd = greeting.index(greeting.startIndex, offsetBy: 7 + worldLength)
let worldRange = worldStart..<worldEnd
let world = greeting[worldRange]

//let worldRange = greeting.range(of: "world")
//let world = greeting[worldRange!]  // note: optional type is unwrapped with !

// See above for another way of getting the range of a substring.
// But the substring might not be found in the original.
// That's why range(of:) returns an optional type.
// We don't know about them yet, but since we know that the substring
// will be there, we can just "force unwrap" it. Not the best style,
// but it works for now...
