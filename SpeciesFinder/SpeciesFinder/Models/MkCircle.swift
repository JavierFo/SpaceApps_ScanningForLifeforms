//
//  MkCircle.swift
//  SpeciesFinder
//
//  Created by Javier Ferrer Ortega on 03/10/20.
//  Copyright © 2020 BiohackersSpaceApps. All rights reserved.
//

import MapKit

class Character: MKCircle {
  // 2
  var color: UIColor?
  
  // 3
    convenience init(color: UIColor, center : CLLocationCoordinate2D, radius : CLLocationDistance) {
//    guard let points = Park.plist(filename) as? [String] else {
//      self.init()
//      return
//    }
    
//    let cgPoints = points.map { NSCoder.cgPoint(for: $0) }
//    let coords = cgPoints.map {
//      CLLocationCoordinate2D(
//        latitude: CLLocationDegrees($0.x),
//        longitude: CLLocationDegrees($0.y))
//    }
    
    //let randomRadius = CLLocationDistance(Int.random(in: 5...39))
    
    self.init(center: center, radius: radius)
    self.color = color
  }
}
