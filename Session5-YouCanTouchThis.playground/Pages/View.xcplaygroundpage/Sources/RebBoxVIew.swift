//
//  RebBoxVIew.swift
//  YouCanTouchThis
//
//  Created by T. Andrew Binkowski on 2/7/16.
//  Copyright © 2016 The University of Chicago, Department of Computer Science. All rights reserved.
//

import UIKit
import AudioToolbox


class RedBox: UIView {

  //
  // MARK: - Initialization
  //
  
  override init (frame : CGRect) {
    super.init(frame : CGRectMake(100, 100, 100, 100))
    backgroundColor = UIColor.redColor()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  //
  // MARK: - Touch handling
  //
  override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
    print("Touches Began EVENT: \(event)")
    
    // TODO: Add a beep
    
  }
  
  override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
    print("Touches Ended EVENT: \(event)")
  }
  
  override func touchesCancelled(touches: Set<UITouch>?, withEvent event: UIEvent?) {
    print("EVENT: \(event)")
  }
  
  override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
    print("EVENT: \(event)")
  }
  
  
}