//
//  SpeciesMapViewController.swift
//  SpeciesFinder
//
//  Created by Javier Ferrer Ortega on 03/10/20.
//  Copyright © 2020 BiohackersSpaceApps. All rights reserved.
//

import UIKit
import MapKit

class SpeciesMapViewController: UIViewController {

    @IBOutlet weak var SpeciesMap: MKMapView!
    @IBOutlet weak var latitudeTextField: UITextField!
    @IBOutlet weak var longitudeTextField: UITextField!
    
    let speciesAnnotation = MKPointAnnotation()
    var centerLocation : CLLocationCoordinate2D?
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        guard let touch = touches.first else {
            return
        }
        let touchPoint = touch.location(in: SpeciesMap)
        let location = SpeciesMap.convert(touchPoint, toCoordinateFrom: SpeciesMap)
        centerLocation = location
        print ("\(location.latitude), \(location.longitude)")
        speciesAnnotation.title = "Scan For Species Around?"
        speciesAnnotation.coordinate = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
        SpeciesMap.addAnnotation(speciesAnnotation)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SpeciesMap.delegate = self
    }

}

extension SpeciesMapViewController : MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        
        if let character = overlay as? Character {
          let circleView = MKCircleRenderer(overlay: character)
          circleView.strokeColor = character.color
          return circleView
        }
        
        return MKOverlayRenderer()
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        print("The annotation was selected: \(String(describing: view.annotation?.title))")
        
        if let centerLocation_ = centerLocation {
            SpeciesMap.addOverlay(Character(color: .green, center: centerLocation_))
        }
        
    }
    
    
}
