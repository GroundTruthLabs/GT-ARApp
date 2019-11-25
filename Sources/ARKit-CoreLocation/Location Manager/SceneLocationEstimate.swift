//
//  SceneLocationEstimate.swift
//  GTARKit+CoreLocation
//
//  Created by Tejeshwar Gill on 03/10/2019.
//  Copyright © 2019 Project GT. All rights reserved.
//

import Foundation
import CoreLocation
import SceneKit

public class SceneLocationEstimate {
    public let location: CLLocation
    public let position: SCNVector3

    init(location: CLLocation, position: SCNVector3) {
        self.location = location
        self.position = position
    }
}
