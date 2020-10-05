//
//  SpeciesAPIs.swift
//  SpeciesFinder
//
//  Created by Javier Ferrer Ortega on 04/10/20.
//  Copyright © 2020 BiohackersSpaceApps. All rights reserved.
//

import Foundation
import UIKit

func imageServer(latitude: [Float], longitude: [Float], completionHandler: @escaping () -> Void) {
   DispatchQueue.main.async {
       UIApplication.shared.isNetworkActivityIndicatorVisible = true
   }

    let session = URLSession.shared
    let eventsTrackerApiURL = "https://api.nasa.gov/planetary/earth/imagery?lon=100.75&lat=1.5&date=2014-02-01&api_key=DEMO_KEY"
    let url = URL(string: eventsTrackerApiURL)!
    let apiKey_ = "hAV1x26HuzQ0Cl6GK2vio4U9LVsM9nuckCSSgP2t"
    
    let request = URLRequest(url: url)
        let task = session.dataTask(with: request) {
            (data, response, error) -> Void in
            
//            let jsonDecoder = JSONDecoder()
//            if let data = data, let productList = try? jsonDecoder.decode([IngredientsList].self, from: data){
//                completion(productList)
//            }   else if let requestError = error {
//                print("Error fetching interesting photos: \(requestError)")
//                } else {
//                print("Unexpected error with the request")
//                }
            }
    
        task.resume()
}
