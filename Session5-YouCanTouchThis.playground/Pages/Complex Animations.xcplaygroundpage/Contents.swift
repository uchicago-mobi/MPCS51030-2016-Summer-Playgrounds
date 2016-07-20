//: [Previous](@previous)

import UIKit
import XCPlayground

//: # View Playground

import UIKit
import XCPlayground


//: ## Create a Container
//: Create a container view that represents iPhone 6 "screen".
//: This allows you to simulate add/removing/animating views on
//: a parent view (i.e. a view controller's main view)

let containerFrame = CGRectMake(0, 0, 375.0, 667.0)
let containerView = UIView(frame: containerFrame)
containerView.backgroundColor = UIColor.lightGrayColor()

//: Set the playgrounds `liveView` to the container view
//: tell it to run indefinately
XCPlaygroundPage.currentPage.liveView = containerView
XCPlaygroundPage.currentPage.needsIndefiniteExecution = true

//: Add a green box to our container view
let greenView = UIView(frame: CGRectMake(0, 0, 50, 50))
greenView.backgroundColor = UIColor.greenColor()
containerView.addSubview(greenView)

//: Add a red box to our container view
let redView = UIView(frame: CGRect(x: 50.0, y: 50.0, width: 50.0, height: 50.0))
redView.backgroundColor = UIColor.redColor()
containerView.addSubview(redView)



//: Add a rotation transform to our red box view
UIView.animateWithDuration(2.0, animations: { () -> Void in
    let rotationTransform = CGAffineTransformMakeRotation(3.14)
    redView.transform = rotationTransform
})


//: ## Circle
//: Note that we are setting the x and y to 0.0.  At 
//: this point we do not care where the view is 
//: posititioned.  We are going to position it using 
//: the `center` property later
let circle = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 50.0, height: 50.0))
circle.center = containerView.center
circle.layer.cornerRadius = 25.0

let startingColor = UIColor.orangeColor()
circle.backgroundColor = startingColor

// Add the view to the containerView
containerView.addSubview(circle);

//: ## Add a rectangle with curved edge
let rectangle = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 50.0, height: 50.0))
rectangle.center = containerView.center
rectangle.layer.cornerRadius = 5.0
rectangle.backgroundColor = UIColor.whiteColor()
containerView.addSubview(rectangle)

//:
UIView.animateWithDuration(2.0, animations: { () -> Void in
  let endingColor = UIColor.greenColor()
  circle.backgroundColor = endingColor
  
  let scaleTransform = CGAffineTransformMakeScale(5.0, 5.0)
  circle.transform = scaleTransform
  
  let rotationTransform = CGAffineTransformMakeRotation(3.14)
  rectangle.transform = rotationTransform
})

//: Let Playground know we're done with this page
//XCPlaygroundPage.currentPage.finishExecution()


//: [Next](@next)
