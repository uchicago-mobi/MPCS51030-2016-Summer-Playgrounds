//
//  MapAnnotation.swift
//  2016-Locations
//
//  Created by T. Andrew Binkowski on 2/22/16.
//  Copyright © 2016 The University of Chicago, Department of Computer Science. All rights reserved.
//

import Foundation
import MapKit

///
/// Custom object to hold our custom annotation
///
class MapAnnotation: NSObject, MKAnnotation {
  let title: String?
  let subtitle: String?
  let coordinate: CLLocationCoordinate2D
 
  init(title: String, subtitle: String, coordinate: CLLocationCoordinate2D) {
    self.title = title
    self.subtitle = subtitle
    self.coordinate = coordinate
 
    super.init()
  }
 
}