//
//  SCNVecto3+Extensions.swift
//  GTARKit+CoreLocation
//
//  Created by Tejeshwar Gill on 09/07/2019.
//  Copyright © 2019 Project GT. All rights reserved.
//

import SceneKit

public extension SCNVector3 {
    ///Calculates distance between vectors
    ///Doesn't include the y axis, matches functionality of CLLocation 'distance' function.
    func distance(to anotherVector: SCNVector3) -> Float {
        return sqrt(pow(anotherVector.x - x, 2) + pow(anotherVector.z - z, 2))
    }
}
