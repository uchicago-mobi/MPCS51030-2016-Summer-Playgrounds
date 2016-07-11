//: [Previous](@previous)

import Foundation

//: ## The Guard Statement

//: Test for conditionals....  



// Define some optional fruit integers
var apples: Int?
var oranges: Int?

apples = 4

//: ### If-Let
//: Use an `if-let` statement to unwrapp the `apples` variable to the temporary variable
//: `apples1`.

if let apples1 = apples {
  print("We have \(apples1) apples")
  //
  // Do something awesome with the apples data
  //
} else {
  print("We don't have \(apples) apples")
}

//: >Remeber that the value of `apples1` is only valid **within** the scope
//: >of the `if-let` statement
//: >If we try to access `apples1` out of the scope, we will get an error.  This
//: >can lead to some very, very long nested code blocks
//print("Apples: \(apples1)")
//print("Oranges: \(oranges)")



//: Using guard we can test against the condition that an optional variable
//: has a value and the unwrap it.  The unwrapped value will be accessible
//: outside the scope of the guard statement.

guard let apples2 = apples else {
  print("We don't have apples")
  
  // The guard statement needs to return if the `nil` condition is met.
  fatalError("We don't have apples")
  //return would be more common in an application
}

print("We have \(apples2) apples and they are unwrapped for the rest of the scope.")


//: ### Using guard in functions


/// This function will exit early due to a
func guardApplesAndOranges(apples: Int?, oranges: Int?) -> String {
  
  guard let apple = apples, orange = oranges else {
    return "We don't have apples or oranges"
  }
  return "We have apples and oranges"
}

var apple: Int?
var orange: Int?

apple = 4
guardApplesAndOranges(apple, oranges: orange)

//: Both condidtions met
orange = 20
guardApplesAndOranges(apple, oranges: orange)



//: [Next](@next)
