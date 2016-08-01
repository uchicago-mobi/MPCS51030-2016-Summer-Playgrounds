//
//  OnboardingViewController.swift
//  DoNotTry
//
//  Created by T. Andrew Binkowski on 3/6/16.
//  Copyright © 2016 The University of Chicago, Department of Computer Science. All rights reserved.
//

import UIKit

class OnboardingViewController: UIViewController {
  
  //
  // MARK: - IBActions
  //
  
  @IBAction func tapContinue(sender: UIButton) {
    simpleTransition()
    //fancyTransition()
  }
  
  //
  // MARK: - RootViewController Transitions
  //
  
  /// Change the root view controller after a simple `UIView` animation from the
  /// original view controller to the new view controller.
  ///
  func simpleTransition() {
    
    // Load the initial view controller from `Main.storyboard`
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let viewController = storyboard.instantiateInitialViewController() as! ViewController
    self.view.window?.rootViewController = viewController

    
    return
      // Animate between the view controller's views and then swap the root view
      // controllers when donw
      UIView.transitionFromView(self.view,
        toView: viewController.view, duration: 0.5,
        options: UIViewAnimationOptions.TransitionFlipFromLeft) { (completed) -> Void in
          if (completed) {
            self.view.window?.rootViewController = viewController
          }
    }
  }
  
  /// Change the root view controller with a custom `UIView` animation using the
  /// following steps:
  /// 1. Take screnshot of the original view controller
  /// 2. Add screenshot as subview of destination view controller
  /// 3. Switch the root view controller
  /// 4. Do animation that results in remove the snapshot.
  ///
  func fancyTransition() {
    // Load the initial view controller from `Main.storyboard`
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let viewController = storyboard.instantiateInitialViewController() as! ViewController
    
    // Take a snapshot of the current view
    let snapshot:UIView = (self.view.window?.snapshotViewAfterScreenUpdates(true))!
    
    // Add the snapshot on top of the `ViewController`'s `view`
    viewController.view.addSubview(snapshot)
    
    // Change the window's `rootViewController`.  The new view controller is now
    // on screen with the old view controller snapshot on top
    self.view.window?.rootViewController = viewController
    
    // Animate the snapshot off the new view controller (ie. create your own
    // transition animation
    UIView.animateWithDuration(1.0, animations: { () in
      snapshot.layer.opacity = 0
      snapshot.layer.transform = CATransform3DMakeScale(10, 10, 10)
      }, completion: { (completed) in
        // Remove the snapshot
        snapshot.removeFromSuperview();
    })
    
  }
  
  //
  // MARK: - Lifecyle
  //
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
  }
  
  
  
  
}
