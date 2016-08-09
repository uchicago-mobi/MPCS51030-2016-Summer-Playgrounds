//
//  ViewController.swift
//  HelpingHand
//
//  Created by T. Andrew Binkowski on 5/11/15.
//  Copyright (c) 2015 The University of Chicago. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var headerLabel: UILabel!
  
    //
    //
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        self.headerLabel.accessibilityTraits = UIAccessibilityTraitHeader
        
    }

    
    //
    // MARK: - Magic Tap
    //
  
    override func accessibilityPerformMagicTap() -> Bool {
        print("You performed the magic tap")
        UIAccessibilityPostNotification(UIAccessibilityAnnouncementNotification, "You performed the magic tap")
        return true
    }
}

