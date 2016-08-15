//
//  AppDelegate.swift
//  HeyYou
//
//  Created by T. Andrew Binkowski on 4/24/16.
//  Copyright © 2016 The University of Chicago, Department of Computer Science. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  
  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    
    // Recognize that a launch was done from a a local notification.  You can 
    // use the same technique to determine if it was a remote notification. You 
    // may consider changing default behavior based on notification
    if let notification:UILocalNotification = launchOptions?[UIApplicationLaunchOptionsLocalNotificationKey] as? UILocalNotification {
      print("Launch from local notification: \(notification)")
    }
    
    return true
  }
  
  func applicationWillResignActive(application: UIApplication) {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
  }
  
  func applicationDidEnterBackground(application: UIApplication) {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
  }
  
  func applicationWillEnterForeground(application: UIApplication) {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
  }
  
  func applicationDidBecomeActive(application: UIApplication) {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
  }
  
  func applicationWillTerminate(application: UIApplication) {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
  }
  
  //
  // MARK: - Local Notifications
  //
  func application(application: UIApplication, didReceiveLocalNotification notification: UILocalNotification) {
    print("Received Local Notification: \(notification)")
    showAlertForNotification(notification)
  }
  
  /// Create an alert to show if the application is active and receives a local
  /// notification
  /// - parameter notification: The `UILocalNotification` received
  func showAlertForNotification(notification: UILocalNotification) {
    
    // Do not show unless the application is active
    guard UIApplication.sharedApplication().applicationState == .Active else { return }
    
    // Create the alert
    let alertController = UIAlertController(title: "Recieved Local Notification",
                                            message: notification.description,
                                            preferredStyle: .Alert)
    
    // Create cancel action that does nothing
    let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
    alertController.addAction(cancelAction)
    
    // Show the alert and exit early
    self.window?.rootViewController?.presentViewController(alertController,
                                                           animated: true,
                                                           completion: nil)
  }


  //
  // MARK: - Interactive Notifications
  //
  
  func application(application: UIApplication, handleActionWithIdentifier identifier: String?,
                   forLocalNotification notification: UILocalNotification,
                   completionHandler: () -> Void) {
    print("Local Action: \(notification)")
    
    if identifier == "kAction1" {
      print("Identifier: \(identifier)")
    } else {
      print("Identifier: \(identifier)")
    }
    
    // Fire off the completion hanndler
    completionHandler()
  }
  
  
  //
  // MARK: - Remote Notifications
  // Note that these are not fully implemented due to limitations of the testing
  // remote notifications from develoment environment
  //
  
  func application(application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData) {
    print("Registered for Push notifications with token: \(deviceToken)")
  }
  
  func application(application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: NSError) {
    print("Push subscription failed: \(error)")
  }
  
  
  func application(application: UIApplication, didReceiveRemoteNotification userInfo: [NSObject : AnyObject]) {
    print("Received Push notification: \(userInfo)")
  }
  
  func application(application: UIApplication, didReceiveRemoteNotification userInfo: [NSObject : AnyObject],
                   fetchCompletionHandler completionHandler: (UIBackgroundFetchResult) -> Void) {
    // Do stuff
    print("Received Push notification: \(userInfo)")
  }
  
  
}

