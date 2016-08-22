//
//  ViewController.swift
//  SettingsBundle
//
//  Created by T. Andrew Binkowski on 3/8/16.
//  Copyright © 2016 The University of Chicago, Department of Computer Science. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var namePreferenceLabel: UILabel!
  
  // 
  // MARK: - IBActions
  //
  @IBAction func tapGoToSettings(sender: UIButton) {
    let url = NSURL(string: UIApplicationOpenSettingsURLString)
    UIApplication.sharedApplication().openURL(url!)
  }
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    showDefaults()
    
    // Register for notification about settings changes
    NSNotificationCenter.defaultCenter().addObserver(self,
      selector: "defaultsChanged",
      name: NSUserDefaultsDidChangeNotification,
      object: nil)
  }
  
  // Stop listening for notifications when view controller is gone
  deinit {
    NSNotificationCenter.defaultCenter().removeObserver(self)
  }
  
  
  
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    
    namePreferenceLabel.text = NSUserDefaults.standardUserDefaults().stringForKey("name_preference")
  }
  
  
  
  
  
  
  
  
  
  
  func showDefaults() {
    
    let defaults = NSUserDefaults.standardUserDefaults()
    let namePreference = defaults.stringForKey("name_preference")
    let sliderPreference = defaults.doubleForKey("slider_preference")
    let enabledPreference = defaults.boolForKey("enabled_preference")
    
    print("Name: \(namePreference)")
    print("Slider: \(sliderPreference)")
    print("Enabled: \(enabledPreference)")
    
    
  }
  
  
  //
  // MARK: - Notification Handlers
  //
  
  /// Called when user defaults is changed via a `NSNotification` broadcast.
  /// You don't get information about what was changed, you have to get all
  /// relevant values yourself and then use them accordingly.  In this case, we
  /// update a label on the screen.
  ///
  func defaultsChanged() {
    let namePreference = NSUserDefaults.standardUserDefaults().stringForKey("name_preference")
    namePreferenceLabel.text = "Name Preference: \(namePreference!)"
  }

  
  
  
  
  
}

