//
//  SecondViewController.swift
//  2016-Locations
//
//  Created by T. Andrew Binkowski on 2/21/16.
//  Copyright © 2016 The University of Chicago, Department of Computer Science. All rights reserved.
//

import UIKit
import CoreLocation

class SecondViewController: UIViewController {
  
  /// Instance of CLLocaitonManager for this view controller
  let locationManager = CLLocationManager()
  
  ///
  /// MARK: - Lifecycle
  ///
  override func viewDidLoad() {
    super.viewDidLoad()
    
    guard CLLocationManager.locationServicesEnabled() else { return }
    
    locationManager.delegate = self
    
    // Register a region and monitor for it
    let rioRegion = registerGeographicalRegion()
    locationManager.startMonitoringForRegion(rioRegion)
    print(locationManager.monitoredRegions)
    
    // Test your current state (calls `didDetermineState`)
    locationManager.requestStateForRegion(rioRegion)
  }
  
  
  ///
  /// MARK: - Region
  ///
  
  /// Monitor for Rio based on the GPS coordinates
  /// - Returns: A CLCircularRegion
  func registerGeographicalRegion() -> CLCircularRegion {
    let coordinate = CLLocationCoordinate2DMake(-22.903, -43.2095)
    let rioRegion = CLCircularRegion(center: coordinate, radius: 100, identifier: "Rio")
    rioRegion.notifyOnEntry = true
    rioRegion.notifyOnExit = true
    return rioRegion
  }
  
}


extension SecondViewController: CLLocationManagerDelegate {
  
  func locationManager(manager: CLLocationManager, didEnterRegion region: CLRegion) {
    print("Entering Rio.  Carnival!!!")
    
    // Launch a background task
    guard UIApplication.sharedApplication().applicationState == UIApplicationState.Background else {
      return
    }
    
    // Ask the system for time to run a short task
    var bti : UIBackgroundTaskIdentifier = 0
    bti = UIApplication.sharedApplication()
      .beginBackgroundTaskWithExpirationHandler({
      // This will happend when it quits
      //
      UIApplication.sharedApplication().endBackgroundTask(bti)
      })
    
    // Do some work here
    print("This is running in the background")
  }
  
  func locationManager(manager: CLLocationManager, didExitRegion region: CLRegion) {
      print("Leaving Rio")
      
      // Stop once we leave
      locationManager.stopMonitoringForRegion(region)
  }
  
  // Called when we request state for region
  func locationManager(manager: CLLocationManager, didDetermineState state: CLRegionState, forRegion region: CLRegion) {
        print(region)
        if region.description == "Rio" {
    if state == CLRegionState.Inside {
    print("We are already in Rio")
    }
        }
  }
  
}
