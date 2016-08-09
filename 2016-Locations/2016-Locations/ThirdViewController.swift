//
//  ThirdViewController.swift
//  2016-Locations
//
//  Created by T. Andrew Binkowski on 2/22/16.
//  Copyright © 2016 The University of Chicago, Department of Computer Science. All rights reserved.
//

import UIKit
import CoreLocation

class ThirdViewController: UIViewController {
  
  ///
  /// MARK: - Lifecycle
  ///
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let address = "Disney World"
    let geocoder = CLGeocoder()
    
    geocoder.geocodeAddressString(address, completionHandler: {(placemarks, error) -> Void in
      if((error) != nil){
        print("Error", error)
      }
      if let placemark = placemarks?.first {
        let coordinates:CLLocationCoordinate2D = placemark.location!.coordinate
        print(coordinates)
      }
    })
    
    // Get the address for the location
    addressForLocation()
  }
  
  ///
  /// Attempt to get an address for a location
  ///
  func addressForLocation() {
    CLGeocoder().reverseGeocodeLocation(CLLocation(latitude: 28.3802066, longitude: -81.5753069),
      completionHandler: { (placemarks: [CLPlacemark]?, error: NSError?) in
        
        guard (error == nil), let placemarks = placemarks else {
          print("Error in geoCoding: \(error!.localizedDescription)") // we can safely unwrap error here
          return
        }
        
        if let placemark = placemarks.first { // placemarks is automatically unwrapped in this case
          self.displayLocationInfo(placemark)
        }
    })
  }
  
  ///
  /// Extract some data from the placemark
  ///
  func displayLocationInfo(placemark: CLPlacemark) {
    var tempString : String = ""
    
    if(placemark.locality != nil){
      tempString = tempString +  placemark.locality! + "\n"
    }
    if(placemark.postalCode != nil){
      tempString = tempString +  placemark.postalCode! + "\n"
    }
    if(placemark.country != nil){
      tempString = tempString +  placemark.country! + "\n"
    }
    print(tempString)
  }
  
}



