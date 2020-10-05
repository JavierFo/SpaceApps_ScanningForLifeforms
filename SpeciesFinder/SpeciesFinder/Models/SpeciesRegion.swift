//
//  GeneralFunctions.swift
//  SpeciesFinder
//
//  Created by Javier Ferrer Ortega on 04/10/20.
//  Copyright © 2020 BiohackersSpaceApps. All rights reserved.
//

import Foundation

struct Region : Codable {
    
    var ENDANGERED_SPECIES : [String]
    var longitude : Float
    var Latitude : Float
    
    var region : [String : Any]{
        return ["ENDANGERED_SPECIES": ENDANGERED_SPECIES, "Longitude" : longitude, "Latitude" : Latitude]
    }
    
}

