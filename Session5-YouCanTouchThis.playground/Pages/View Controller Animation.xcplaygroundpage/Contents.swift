//:[Previous](@previous)

import UIKit
import XCPlayground

//: Create a view controller
class VC: UIViewController {
  let newView = UIView()
  
  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    newView.frame = view.bounds
    newView.backgroundColor = .redColor()
    
    UIView.transitionFromView(view,
                              toView: newView,
                              duration: 3.0,
                              options: [.TransitionFlipFromTop],
                              completion: nil)
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .greenColor()
  }
  
}



// Create an instance of the view controller
let vc = VC()

// Allow playground to live
XCPlaygroundPage.currentPage.liveView = vc
XCPlaygroundPage.currentPage.needsIndefiniteExecution = true


//: [Next](@next)
