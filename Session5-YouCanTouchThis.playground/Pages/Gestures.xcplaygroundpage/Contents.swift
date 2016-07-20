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
    
    
    // Create a tap gesture recoginzer
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(VC.handleTap(_:)))
    tapGesture.numberOfTapsRequired = 2
    
    // Add a tap gesture recognizer to the box
    box.addGestureRecognizer(tapGesture)
  }
  
  /// Handle the tap gesture recognizer
  func handleTap(gestureRecognizer: UIGestureRecognizer) {
    print("Tapped: \(gestureRecognizer)")
    self.currentColor = .purpleColor()
    print("View: \(gestureRecognizer.view)")
  }
}



// Create an instance of the view controller
let vc = VC()

// Allow playground to live
XCPlaygroundPage.currentPage.liveView = vc
XCPlaygroundPage.currentPage.needsIndefiniteExecution = true


//: [Next](@next)
