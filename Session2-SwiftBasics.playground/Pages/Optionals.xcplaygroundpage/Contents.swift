//: [Previous](@previous)

//: # Optionals

import Foundation

//: In the Objective-C runtime, messaging nil returns nil, which means the null pointer is effectively safe. However, this doesn’t particularly help you if you’re expecting the reference to be non-nil. The usual way around this is to do an assertion check that the variable is never nil. In debug mode, your app would crash if it encounters nil, so you can find the bug and fix it before releasing the code.

//: When you do need the nil value, you can use an optional. Optionals are a way of wrapping up the concept of “has a value” or “may have a value” into a language-wide feature.


// Declare an optional
var device: String? 
//print(device!)
print("HI")


// Declare an optinal and assign it a value
var phone: String? = ""
var pad: String? = "iPad 2"

// The value type is 'optional'
print(phone)
print(phone!)




//: Need to **unwrap** the value of the optional.  Unwrapping using `if-let` assigns the value to a new constant.  If the optional value is nil, the conditional is false and the code in braces is skipped. Otherwise, the optional value is unwrapped and assigned to the constant after let, which makes the unwrapped value available inside the block of code.

if let unwrappedPhone = phone {
    print("The unwrapped value of phone is: \(unwrappedPhone)")
}

// Unwrap multiple values at the same time
if let
    unwrappedPhone = phone,
    unwrappedPad = pad
  {
    print("The unwrapped value of phone is: \(unwrappedPhone)")

}


// You can also assign it to the same variable (which may be confusing)
if let phone = phone {
    print("The unwrapped value of phone is: \(phone)")
}
print(phone)



//: When you are using optionals, you are asking a series of question:
//:  - Is the value `nil`?
//:  - If yes, then do something
//:  - If no, then unwrap it and copy the value to a new constant
//: This makes handling `nil` value safe.  There are many classes in `UIKit` that may return `nil`.  For example a `UIView` may return `nil` if it is not instantiated correctly.  It would not have mattered that much in Objective-C since you could still safely send messages to the `nil` instance (e.g. [view setBackgroundColor]).

//: ## Forced unwrapping
//: If you already know that a particular optional contains a value, then you can use what is known as forced unwrapping. This means you don’t need the if statement to check if the optional contains a value.

var optionalString: String? = "Hello World!"
print("Force unwrapped! \(optionalString!.uppercaseString)")

//: This is convienent, but elimates the safety design of Swift
//: ## Implicit unwrapping
var optionalString2: String! = "Hello World!"
print("Implicit unwrapped! \(optionalString2.uppercaseString)")

//: ## Optional Chaining
//: Optional chaining is a concise way to work with optionals quickly without using if/let and a conditional block each time.

var maybeString: String? = "The eagle has landed"

// If `maybeString` is not `nil` then `.uppercaseString` will be evaluated.  If it is `nil`, it will return `nil`

if let uppercase = maybeString?.uppercaseString


//: # Functions
//: Use func to declare a function. Call a function by following its name with a list of arguments in parentheses. Use -> to separate the parameter names and types from the function’s return type.
func greet(name: String, day: String) -> String {
    return "Hello \(name), today is \(day)."
}

// Run the function
let myReturnedString = greet("Bob", day: "Tuesday")

print()
//: Use a tuple to make a compound value—for example, to return multiple values from a function. The elements of a tuple can be referred to either by name or by number.
func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores {
        if score > max {
        max = score
    } else if score < min {
        min = score
        }
        sum += score
    }
    
    return (min, max, sum)
}
let statistics = calculateStatistics([5, 3, 100, 3, 9])
print(statistics.sum)
print(statistics.2)

//: [Next](@next)
