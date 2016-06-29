//: [Previous](@previous)




//: # Control Flow


import Foundation

//: Use if and switch to make conditionals, and use for-in, for, while, and do-while to make loops. Parentheses around the condition or loop variable are optional. Braces around the body are required.

let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0

for score in individualScores {
    if score > 50 {
    teamScore += 3
} else {
    teamScore += 1
    }
}
print(teamScore)

//: ## If Statements
//: Evaluate a condition
let temp = 70

if temp > 70 {
    print("It's hot out")
} else if temp > 50 {
    print("Its nice out")
} else {
    print("It's cold out")
}

//: ## For Loops
//: The `for-in` loop performs a set of statements for each item in a range, sequence, collection, or progression.  The `for` loop performs a set of statements until a specific condition is met, typically by incrementing a counter each time the loop ends

//: Range operator `...`
//for index in 5...0 {
//    print(index)
//}

//: Closed range operature `..<` show
for index in 0..<5 {
    print(index)
}

//: C-style `for` loops
// Going away in Swift 3.0
for var index = 0; index < 5; index++ {
    print(index)
}

//: You use for-in to iterate over items in a dictionary by providing a pair of names to use for each key-value pair. Dictionaries are an unordered collection, so their keys and values are iterated over in an arbitrary order.
let interestingNumbers = [
  "Prime": [2, 3, 5, 7, 11, 13],
  "Fibonacci": [1, 1, 2, 3, 5, 8],
  "Square": [1, 4, 9, 16, 25],
]

var largest = 0
for (kind, numbers) in interestingNumbers {
  for number in numbers {
    if number > largest {
      largest = number
    }
  }
}
print(largest)

//: ## While Loops
//: Swift supports while loops as well as do-while loops,
var i = 0
while i < 5 {
    print(i)
    i++
}

// The repeat-while varint (it used to be do-while)
i = 0
repeat {
    print("Hello world")
    i++
} while (i<5)

//: ## Switch Statement
//: Switches support any kind of data and a wide variety of comparison operations—they aren’t limited to integers and tests for equality.  Note that there in break statement after each case.  Switch statements must be exhaustive and may require using a `default` case.

let vegetable = "red pepper"

switch vegetable {
case "celery":
    let vegetableComment = "Add some raisins and make ants on a log."

case "cucumber", "watercress":
    let vegetableComment = "That would make a good tea sandwich."

case let x where x.hasSuffix("pepper"):
    let vegetableComment = "Is it a spicy \(x)?"

default:
    let vegetableComment = "Everything tastes good in soup."
}


//: [Next](@next)
