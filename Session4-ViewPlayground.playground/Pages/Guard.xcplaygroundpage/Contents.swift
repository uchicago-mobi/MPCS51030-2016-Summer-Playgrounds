//: [Previous](@previous)

import Foundation

//: ## Guard

var apples: Int?
var oranges: Int?

apples = 4

if let apples1 = apples {
  print("We have \(apples1) apples")
  
  // Do a bunch of stuff with the apples data
  //
  //
  //
  //
  
} else {
  print("We don't have \(apples) apples")
}

// Error
// print("Apples: \(apples1)")
// print("Oranges: \(oranges)")

//: Using guard we can test against the condition and unwrap it


guard let apples2 = apples else {
  print("We don't have apples")
  //return
  fatalError("We don't have apples")
}

print("We have \(apples2) apples and they are unwrapped for the rest of the scope.")

// Do a bunch of stuff with the apples data
//
//
//
//

func testApplesAndOranges() {
  
  var apples: Int?
  var oranges: Int?
  
  apples = 4

  guard let apple = apples,
    orange = oranges else {
      print("We don't have apples or oranges")
      return
      //fatalError("We don't have apples or oranges")
  }
  
  print("Apples: \(apple)")
  print("Oranges: \(orange)")
}

//: Both condidtions met

func testApplesAndOranges2() {
  
  var apples: Int?
  var oranges: Int?
  
  apples = 4
  oranges = 10

  guard let apple = apples,
    orange = oranges else {
      print("We don't have apples or oranges")
      return
      //fatalError("We don't have apples or oranges")
  }
  
  // Unwrapped for the scope
  print("Apples: \(apple)")
  print("Oranges: \(orange)")
}


//: [Next](@next)
