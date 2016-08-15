//
//  FirstViewController.swift
//  HeyYou
//
//  Created by T. Andrew Binkowski on 4/24/16.
//  Copyright © 2016 The University of Chicago, Department of Computer Science. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

  let kActionCategory = "kActionCategory"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
  

  //
  // MARK: - Register for Notifications
  //
  
  @IBAction func registerForLocalNotifications(sender: AnyObject) {

    // Register for notification with no actions
    //let notificationTypes: UIUserNotificationType = [.Alert, .Badge, .Sound]
    //let notificationSettings = UIUserNotificationSettings(forTypes: notificationTypes, categories: nil)
    //UIApplication.sharedApplication().registerUserNotificationSettings(notificationSettings)

    // Register for notifications with actions
    registerForLocalNotificationsWithActions(0)
  }
  
  
  /// 
  ///
  func registerForLocalNotificationsWithActions(sender: AnyObject) {
    
    // Create background action
    let action1 = UIMutableUserNotificationAction()
    action1.identifier = "kAction1"
    action1.destructive = false
    action1.title = "Background Action"
    action1.activationMode = .Background
    action1.authenticationRequired = false
    
    // Create foreground action
    let action2 = UIMutableUserNotificationAction()
    action2.identifier = "kAction2"
    action2.destructive = false
    action2.title = "Foreground Action"
    action2.activationMode = .Foreground
    action2.authenticationRequired = true
    
    // Create category
    let category = UIMutableUserNotificationCategory()
    category.identifier = kActionCategory
    category.setActions([action1,action2], forContext: .Minimal)
    category.setActions([action1,action2], forContext: .Default)
    
    // Setup the notification
    let notificationTypes: UIUserNotificationType = [.Alert, .Badge, .Sound]
    let notificationSettings = UIUserNotificationSettings(forTypes: notificationTypes, categories: [category])
    UIApplication.sharedApplication().registerUserNotificationSettings(notificationSettings)
  }
  
  
  
  //
  // MARK: - Schedule Notificaitons
  //
  
  @IBAction func scheduleLocalNotification(sender: AnyObject) {
    
    // Check if we have authorization to send notifications
    guard let settings = UIApplication.sharedApplication().currentUserNotificationSettings() else { return }
    
    // If we don't, let the use know and give them the option of going directly
    // to the Settings screen for the application
    if settings.types == .None {
      
      // Create an alert view controller
      let alertController = UIAlertController(title: "😒",
                                              message: "The notification permission was not authorized. Please enable it in Settings to continue.",
                                              preferredStyle: .Alert)
                                              
      // Create to go to settings
      let settingsAction = UIAlertAction(title: "Settings", style: .Default) { (alertAction) in
        if let appSettings = NSURL(string: UIApplicationOpenSettingsURLString) {
          UIApplication.sharedApplication().openURL(appSettings)
        }
      }
      alertController.addAction(settingsAction)
      
      // Create cancel action that does nothing
      let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
      alertController.addAction(cancelAction)
      
      // Show the alert and exit early
      presentViewController(alertController, animated: true, completion: nil)
      return
    }
    
    // Create a notification
    let notification = UILocalNotification()
    notification.fireDate = NSDate(timeIntervalSinceNow: 5)
    notification.alertBody = "Hey you! Swipe to unlock!"
    notification.alertAction = "be awesome!"
    notification.soundName = UILocalNotificationDefaultSoundName
    notification.userInfo = ["kCustomData": "Something here..."]
    notification.category = kActionCategory
    
    // Schedule the notification
    UIApplication.sharedApplication().scheduleLocalNotification(notification)
  }
  
  
  @IBAction func scheduleLocalNotificationNow(sender: AnyObject) {
    
    //  Create a notofication
    let notification = UILocalNotification()
    notification.alertBody = "Hey you! It's Now!"
    notification.alertAction = "Ok!"
    
    // Schedule the notification
    UIApplication.sharedApplication().presentLocalNotificationNow(notification)
    
  }
  
}

