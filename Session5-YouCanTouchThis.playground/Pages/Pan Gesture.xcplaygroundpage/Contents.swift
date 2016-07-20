//:[Previous](@previous)

import UIKit
import XCPlayground

//: Create a view controller
class VC: UIViewController {
  //let newView = UIView()

  var box = UIView(frame: CGRectMake(100,100,100,100))
  var currentColor: UIColor = .whiteColor() {
    willSet {
      self.box.backgroundColor = newValue
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .darkGrayColor()
    
    // Create a yellow box view
    self.currentColor = .yellowColor()
    self.view.addSubview(self.box)
    
    
    // Create a pan gesture recoginzer
    let panGesture = UIPanGestureRecognizer(target: self, action: #selector(VC.handlePan(_:)))
    
    // Add a tap gesture recognizer to the box
    box.addGestureRecognizer(panGesture)
  }
  
 
  /// Reposition the center of a view to correspond with a touch point
  /// - Parameter recognizer: The gesture that is recognized
  func handlePan(recognizer:UIPanGestureRecognizer) {
    // Determine where the view is in relation to the superview
    let translation = recognizer.translationInView(self.view)
    
    if let view = recognizer.view {
      // Set the view's center to the new position
      view.center = CGPoint(x:view.center.x + translation.x,
                            y:view.center.y + translation.y)
    }
    
    // Reset the translation back to zero, so we are dealing in offsets
    recognizer.setTranslation(CGPointZero, inView: self.view)
  }
  

}



// Create an instance of the view controller
let vc = VC()

// Allow playground to live
XCPlaygroundPage.currentPage.liveView = vc
XCPlaygroundPage.currentPage.needsIndefiniteExecution = true


//: [Next](@next)
