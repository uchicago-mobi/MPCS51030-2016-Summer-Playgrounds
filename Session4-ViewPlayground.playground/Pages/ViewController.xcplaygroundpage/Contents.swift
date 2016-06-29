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
      options: [.TransitionCurlUp],
      completion: nil)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .greenColor()
  }
}

//: 
//: 
//:
let vc = VC()

XCPlaygroundPage.currentPage.liveView = vc
XCPlaygroundPage.currentPage.needsIndefiniteExecution = true


//: [Next](@next)
