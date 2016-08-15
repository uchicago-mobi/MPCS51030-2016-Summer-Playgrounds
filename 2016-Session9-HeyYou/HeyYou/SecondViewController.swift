//
//  SecondViewController.swift
//  HeyYou
//
//  Created by T. Andrew Binkowski on 4/24/16.
//  Copyright © 2016 The University of Chicago, Department of Computer Science. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    
    let notificationTypes: UIUserNotificationType = [.Alert, .Badge, .Sound]
    let notificationSettings = UIUserNotificationSettings(forTypes: notificationTypes, categories: nil)
    UIApplication.sharedApplication().registerUserNotificationSettings(notificationSettings)
    UIApplication.sharedApplication().registerForRemoteNotifications()
    
  }
  
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
}

