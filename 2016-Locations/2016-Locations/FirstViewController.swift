//
//  FirstViewController.swift
//  2016-Locations
//
//  Created by T. Andrew Binkowski on 2/21/16.
//  Copyright © 2016 The University of Chicago, Department of Computer Science. All rights reserved.
//

import UIKit
import CoreLocation

class FirstViewController: UIViewController {
  
  /// Instance of CLLocaitonManager for this view controller
  let locationManager = CLLocationManager()
  
  /// A flag to manager if we are defferring updates
  //var deferringUpdates = false
  
  ///
  override func viewDidLoad() {
    super.viewDidLoad()
    
    guard CLLocationManager.locationServicesEnabled() else {
      return
    }
    
    locationManager.delegate = self
    locationManager.headingFilter = kCLHeadingFilterNone
    locationManager.distanceFilter = kCLDistanceFilterNone
    locationManager.desiredAccuracy = kCLLocationAccuracyBest
    
    // Update heading information (doesn't work on simulator)
    if CLLocationManager.headingAvailable() {
      locationManager.startUpdatingHeading()
    }
    
    // Run different monitoring types
    //locationManager.allowDeferredLocationUpdatesUntilTraveled(CLLocationDistanceMax, timeout: CLTimeIntervalMax)
    
    // Check permission status
    let authStatus: CLAuthorizationStatus = CLLocationManager.authorizationStatus()
    
    // Handle all different levels of permissions
    switch authStatus {
      
    case .NotDetermined:
      //locationManager.requestWhenInUseAuthorization()
      locationManager.requestAlwaysAuthorization()
      return
      
    case .Denied, .Restricted:
      presentLocationServicesAlert("Location Services",
        message: "Please enable location services for this app in Settings.")
      return
      
    case .AuthorizedAlways:
      locationManager.startUpdatingLocation()
      
    case .AuthorizedWhenInUse:
      locationManager.startUpdatingLocation()
    }
  }
  
  /// Show an alert with information about the location services status
  func presentLocationServicesAlert(title: String, message: String) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
    
    let affirmativeAction = UIAlertAction(title: "OK", style: .Default) { (alertAction) -> Void in
      // Launch Settings.app directly to the app
      UIApplication.sharedApplication().openURL(NSURL(string: UIApplicationOpenSettingsURLString)!)
    }
    alert.addAction(affirmativeAction)
    
    presentViewController(alert, animated: true, completion: nil)
  }
  
}


///
/// CLLocationManagerDelegate Protocol Delegate Methods
///
extension FirstViewController: CLLocationManagerDelegate {
  
  func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    print("Current Location:\(locations.last)")
  }
  
  func locationManager(manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
    print(newHeading)
    //
    //    guard newHeading.headingAccuracy < 0 else {
    //      return
    //    }
    //
    //    // Use the true heading if it is valid
    //    // Degrees to true north
    //    let theHeading: CLLocationDirection = ((newHeading.trueHeading > 0)
    //                          ? newHeading.trueHeading
    //                          : newHeading.magneticHeading)
    //    print(theHeading)
  }
  
  func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
    print(status)
  }
  
  func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
    print(error)
  }
  
  // Prompt user to perform figure 8 to recalibrate heading
  func locationManagerShouldDisplayHeadingCalibration(manager: CLLocationManager) -> Bool {
    return true
  }
  
  func locationManager(manager: CLLocationManager, didFinishDeferredUpdatesWithError error: NSError?) {
    print("Done with deferred updates")

  
  /// Update locations and make preperations to collect data in the background.
  /// You are responsible for managing the state of deferred background data
  /// collection
  //  func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
  //
  //    if deferringUpdates {
  //      let distance: CLLocationDistance = 1600 // meters
  //        let minimumElapsedTime = 360.0 // seconds
  //        locationManager.allowDeferredLocationUpdatesUntilTraveled(distance, timeout: minimumElapsedTime)
  //        self.deferringUpdates = true
  //    }
  //
  //  }
  }
  
}
