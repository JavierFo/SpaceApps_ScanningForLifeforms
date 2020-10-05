//
//  SpeciesMapViewController.swift
//  SpeciesFinder
//
//  Created by Javier Ferrer Ortega on 03/10/20.
//  Copyright © 2020 BiohackersSpaceApps. All rights reserved.
//

import UIKit
import MapKit

var searchCoordinate: CLLocationCoordinate2D?
var speciesTableValues : [String] = ["NO DATA"]

class SpeciesMapViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var SpeciesMap: MKMapView!
    @IBOutlet weak var scanButton: UIButton!
    @IBOutlet weak var scanSpeciesActivityIndicator: UIActivityIndicatorView!
    
    
    let speciesAnnotation = MKPointAnnotation()
    var centerLocation : CLLocationCoordinate2D?
    
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//
//        guard let touch = touches.first else {
//            return
//        }
//        let touchPoint = touch.location(in: SpeciesMap)
//        let location = SpeciesMap.convert(touchPoint, toCoordinateFrom: SpeciesMap)
//        centerLocation = location
//        print ("\(location.latitude), \(location.longitude)")
//        speciesAnnotation.title = "Scan For Species Around?"
//        speciesAnnotation.coordinate = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
//        SpeciesMap.addAnnotation(speciesAnnotation)
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SpeciesMap.delegate = self
        scanButton.isEnabled = false
        self.setMapview()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        scanButton.isEnabled = false
        scanButton.isHidden = true
    }
    
    func setMapview(){
    
      let lpgr = UILongPressGestureRecognizer(target: self, action: #selector(self.handleLongPress(gestureReconizer:)))
      //let lpgr = UILongPressGestureRecognizer(target: self, action:Selector(SpeciesMap.handleLongPress(gestureReconizer:)))
      lpgr.minimumPressDuration = 0.5
      lpgr.delaysTouchesBegan = true
      lpgr.delegate = self
      self.SpeciesMap.addGestureRecognizer(lpgr)
    }
    
    @objc func handleLongPress(gestureReconizer: UILongPressGestureRecognizer) {
        if gestureReconizer.state != UIGestureRecognizer.State.ended {
        let overlays = SpeciesMap.overlays
        SpeciesMap.removeOverlays(overlays)
        let touchLocation = gestureReconizer.location(in: SpeciesMap)
        let locationCoordinate = SpeciesMap.convert(touchLocation,toCoordinateFrom: SpeciesMap)
        SpeciesMap.addOverlay(Character(color: .green, center: locationCoordinate, radius: 100000))
        speciesAnnotation.title = "Scan For Species Around?"
        speciesAnnotation.coordinate = CLLocationCoordinate2D(latitude: locationCoordinate.latitude, longitude: locationCoordinate.longitude)
        SpeciesMap.addAnnotation(speciesAnnotation)
        searchCoordinate = locationCoordinate
        scanButton.isEnabled = true
        scanButton.isHidden = false

            
        //print("Tapped at lat: \(locationCoordinate.latitude) long: \(locationCoordinate.longitude)")
        return
      }
        if gestureReconizer.state != UIGestureRecognizer.State.began {
        return
      }
    
    }
    
    @IBAction func scanWithCoordinates(_ sender: UIButton) {
        LookForSpeciesWithCoordinates()
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
        //print("The annotation was selected: \(String(describing: view.annotation?.title))")
        
//        if let centerLocation_ = centerLocation {
//            SpeciesMap.addOverlay(Character(color: .green, center: centerLocation_))
//        }
        
    }
    
    
}

func LookForSpeciesWithCoordinates () {
        
//    let searchCoordinateLatitudeMin = searchCoordinate!.latitude - 100
//    let searchCoordinateLongitudeMin = searchCoordinate!.longitude - 100
//
//    let searchCoordinateLatitudeMax = searchCoordinate!.latitude + 100
//    let searchCoordinateLongitudeMax = searchCoordinate!.longitude + 100
    
    let gulfMexlongitude = GulfofMexico["Longitude"] as! Double
    let gulfMexlatitude = GulfofMexico["Latitude"] as! Double
    
    let GulfofCalifornialongitude = GulfofCalifornia["Longitude"] as! Double
    let GulfofCalifornialatitude = GulfofCalifornia["Latitude"] as! Double
    
    let CaribbeanSealongitude = CaribbeanSea["Longitude"] as! Double
    let CaribbeanSealatitude = CaribbeanSea["Latitude"] as! Double
    
    let BeringSealongitude = BeringSea["Longitude"] as! Double
    let BeringSealatitude = BeringSea["Latitude"] as! Double
     
    if (searchCoordinate!.latitude - gulfMexlatitude) <= 1000 || (searchCoordinate!.latitude - gulfMexlatitude) >= -1000 {
        
        speciesTableValues = (GulfofMexico["ENDANGERED_SPECIES"] as? [String])!
        
    }else if (searchCoordinate!.latitude - GulfofCalifornialatitude) <= 1000 || (searchCoordinate!.latitude - GulfofCalifornialatitude) >= -1000 {
        
        speciesTableValues = (GulfofCalifornia["ENDANGERED_SPECIES"] as? [String])!
        
    }else if (searchCoordinate!.latitude - CaribbeanSealatitude) <= 1000 || (searchCoordinate!.latitude - CaribbeanSealatitude) >= -1000 {
        
        speciesTableValues = (CaribbeanSea["ENDANGERED_SPECIES"] as? [String])!
        
    }else if (searchCoordinate!.latitude - BeringSealatitude) <= 1000 || (searchCoordinate!.latitude - BeringSealatitude) >= -1000 {
        
        speciesTableValues = (BeringSea["ENDANGERED_SPECIES"] as? [String])!
    }
    
}
