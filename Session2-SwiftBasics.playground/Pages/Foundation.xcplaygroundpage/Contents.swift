//: [Previous](@previous)

import Foundation
import UIKit

//: Logging
//: -------

// Define a constant string
let dog: String = "Snoopy"

// String interpolation `\(variable)` evaluates a variable
// inside of of a print statement
print("Print: Charlie Brown has a dog named \(dog)")

// Foundation's `NSLog` prints to the console.  Note that
// it does not print to the
NSLog("NSLog: Charlie Brown has a dog named %@",dog)


//: Swift vs. Foundation
//: --------------------
var greeting = "Hello from Swift"

// Make it more exciting using an exclusive Swift `String` API
greeting.appendContentsOf("!")

// Make it more exciting for 2016 using a Foundation NSString API
greeting.stringByReplacingOccurrencesOfString("!", withString: "😀🐼")

// Make it more exciting for the snapchat generation
let image = UIImage(named:"swift.jpg")


//: > Swift 3 will bring feature parity


//: [Next](@next)


