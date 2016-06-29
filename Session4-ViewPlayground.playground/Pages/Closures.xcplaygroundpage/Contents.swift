//: # Closures

import UIKit
import XCPlayground

//: ## Function types
//: Every function has its own function type, made up of the
//: parameter types and the return type of the function itself.
//:
//: For example the following function has a function type of:
//: `(Int, Int) -> (Int)`

func sum(x: Int, y: Int) -> (Int) {
  return x + y
}

//: ## Passing and returning functions
//: The following function is returning another function as
//: its result which can be later assigned to a variable and called.

func cat() -> ((String, Int) -> String) {
  
  func feed(name: String, times: Int) -> (String) {
    return "\(name) has been fed \(times) times"
  }
  return feed
}

let lola = cat()
lola("Lola", 3)


//: ## Closures
//: From Apple:
//: Closures are self-contained blocks of functionality that can be passed around and used in your code. Closures in Swift are similar to blocks in C and Objective-C and to lambdas in other programming languages.
//:
//: Closures can capture and store references to any constants and variables from the context in which they are defined. This is known as closing over those constants and variables, hence the name “closures”. Swift handles all of the memory management of capturing for you.


//: Closures are typically enclosed in curly braces { } and are
//: defined by a function type () -> (), where -> separates the
//: arguments and the return type, followed by the in keyword
//: which separates the closure header from its body.
//: `{ (params) -> returnType in
//:   statements
//: }`


// Required for closures
XCPlaygroundPage.currentPage.needsIndefiniteExecution = true

//: Named closure (a function)
func doSomething(message: String) {
  print("\(message)")
}
doSomething("HI")

//: Function with closure as a parameter
func doSomethingWithCompletion(completion: (String) -> Void) {
  // We're inside the closure here
  let message = "Hi from completion block"

  // Execute the completion block with the required parameter
  completion(message)
}

//: Call a function with a completion handler (closure)
//: Message is the parameter; void is return type
doSomethingWithCompletion { (message) -> Void in
  // This code will be called as the completion block
  print("In closure...")
  print("Message from completion block: \(message)")
}

//: Trailing closure syntax.  Closure arguments can be 
//: references by position ($0, $1, ...)

doSomethingWithCompletion {
  // This code will be called as the completion block
  print("In closure...")
  print("Message from completion block: \($0)")
}



