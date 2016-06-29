//: [Previous](@previous)

//: # Collections and Fast Enumeration

import Foundation

//: ## Arrays and Dictionaries #
//: Create arrays and dictionaries using brackets ([]), and access their elements by writing the index or key in brackets.
var shoppingList = ["catfish", "water", "tulips", "blue paint"]
shoppingList[1] = "bottle of water"

var occupations = [
    "Malcolm": "Captain",
    "Kaylee": "Mechanic",]
occupations["Jayne"] = "Public Relations"

//: To create an empty array or dictionary, use the initializer syntax.
let emptyArray = [String]()
let emptyDictionary = [String: Float]()

//: If type information can be inferred, you can write an empty array as [] and an empty dictionary as [:]—for example, when you set a new value for a variable or pass an argument to a function.
shoppingList = []
occupations = [:]

//: ## Fast enumeration
let numbers = [1, 2, 3]
let strings = ["Homer", "Marge", "1"]
//: Iterate throught the array
// This is going away in Swift 3.0
for var i = 0; i < strings.count; i++ {
    print(strings[i])
}

for string in strings {
    print(string)
}

//: Fancy new ways to iterate through arrays.  These are Swift only features

strings.map({ (string: String) -> Void in
    print(string)
})

strings.filter { (string: String) -> Bool in
        return string.hasPrefix("H")
}

strings.filter { return $0.hasPrefix("M") }

//: Iterate through dictionaries
let luckyNumbers = ["Bob": 17, "Mel": 11, "Lisa": 1337]

for (key, value) in luckyNumbers {
    print("The lucky number of \(key) is \(value)")
}


//: [Next](@next)
