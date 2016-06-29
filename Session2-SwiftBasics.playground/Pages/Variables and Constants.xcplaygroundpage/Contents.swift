//: # MPCS51030 - Session 2 Swift Playground #
//: This playgournd contains basic elements of using Swift.

import UIKit
var str = "Hello, Swift"

//: # Variables and Constants #
//: Use `let` to make a constant and `var` to make a variable. The value of a constant doesn’t need to be known at compile time, but you must assign it a value exactly once.

var myVariable = 44
myVariable = 55
let myConstant = 42
//myConstant = 50

//: A constant or variable must have the same type as the value you want to assign to it. you don’t always have to write the type explicitly. Providing a value when you create a constant or variable lets the compiler infer its type.

let inferredConstant: Int = 42
let implicitInteger = 70
let implicitDouble = 70.0


//: More examples of inference...

let languageName = "Swift"  // inferred as String
var version = 1.0           // inferred as Double
let introduced = 2014       // inferred as Int
let isAwesome = true        // inferred as Bool

//: And just for fun, unicode characters
let π = 3.1415927

//: If the initial value doesn’t provide enough information (or if there is no initial value), specify the type by writing it after the variable, separated by a colon.

let explicitDouble: Int = 70
let explicitString: String = "Apple"

//: Values are never implicitly converted to another type. If you need to convert a value to a different type, explicitly make an instance of the desired type.
let label = "The width is "
let width = 94
let widthLabel = label + String(width)

//: There’s an even simpler way to include values in strings: Write the value in parentheses, and write a backslash (\) before the parentheses. For example:

let name = "lisa"
let age = 8
print(name)
print("Hello my name is \(name) and I am \(age) years old")

// You can even do operations in the blackslashed group
let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit."

//: # Semicolons
//: Semicolons are optional at the end of a line (Swift is a conscise language).

let dog = "Snoopy"
let cat = "Garfield";

// Semicolons are required if you have multiple statements on the same line
let mouse = "Mickey"; let duck = "Donald"

//: # Swift Types

//: ## Strings
//: Some basic string maniuplations

var greeting = "Hello class"
greeting = greeting + " World"
print(greeting)

//: Swift has its own string library.  The Swift String type has API methods that allow you to manipulate their values.
greeting.append(Character("!"))
print(greeting)

//: The Swift String type is also bridged to the Objective-C NSString type, providing all the API methods.  This functionality is being addressed in Swift 3.0

import Foundation       // Access the Foundation frameworks
greeting = "this string should be capitalized".capitalizedString
print(greeting)

// Another NSString method
greeting = "hello".stringByAppendingString(" world")
print(greeting)

// Value types are always copied
var alternateGreeting = greeting
alternateGreeting += " and beyond!"
print(alternateGreeting)
print(greeting)


//: ## Characters

//: ## Booleans
//: Swift has a Boolean type, Bool, that holds a value of either true or false. Once again, you can rely on type inference when creating a variable or constant of this type.  Note that Swift does not map 0/1 to true/false as in Objective-C.  Swift does not support macros.

let always = true
let never = false



//: ## Tuples
//: Tuples group multiple values into a single compound value. The values within a tuple can be of any type and do not have to be of the same type as each other.  Tuples observe the `let` or `var` mutability declarion.
var employee = ("Homer","7G",20)
print(employee.0)
print(employee.1)
print(employee.2)

//: Explicity declare tuple values
var employee2: (String, String, Int) = ("Carl","7G",21)

//: A tuple can be deconstructed into its elements
let (firstName, sector, years) = employee2
let string = "Name:\(firstName.uppercaseString) Sector:\(sector) Year Worked:\(years)"
print(string)

