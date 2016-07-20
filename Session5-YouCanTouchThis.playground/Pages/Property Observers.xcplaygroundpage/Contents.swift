//: [Previous](@previous)

import Foundation

//: # Property Observers
//: Swift also provides the ability to inject functionality into a _setter_ of a stored property variable through property observers.  Property observers observe and respond to changes in a property’s value.

//: The syntax for declaring a property variable is as follows:

//: ```swift
//:/// The array of dictionaries that will hold all of our issues
//:var issues:[[String: AnyObject]]? {
//:  willSet {
//:    // Called before property is set
//:    // the new value is available as parameter `newValue`
//:  }
//:  didSet {
//:    // Called after property is set
//:    // the old values is available as paramter `oldValue`
//:  }
//:}
//:```

//: Property observers are called every time a property’s value is set, even if the new value is the same as the property’s current value.  A great use of property setter is to observe a property and then change the interface to reflect the new value.  Whenever the properties data is updated, it can trigger the interface to update to reflect the change.



var color: String = "blue" {
  willSet {
    print("The color is going to be \(newValue)")
  }
  didSet {
    print("The color was \(oldValue)")
    print("The color is now \(color)")
  }
}

// Set the color to red and see what happens
color = "red"



//: > Using a custom parameter name for `willSet`
var crayon: String = "blue" {
  // The new value can be explicity named as a
  // paramter (or will be available as `newValue`
  willSet(theNewColor) {
    print("The crayon is going to be \(theNewColor)")
  }

  didSet {
    print("The crayon was \(oldValue)")
    print("The crayon is now \(color)")
  }
}

crayon = "pink"


//: [Next](@next)
