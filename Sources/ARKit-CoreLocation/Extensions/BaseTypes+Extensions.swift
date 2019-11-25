//
//  BaseTypes+Extensions.swift
//  GTARKit+CoreLocation
//
//  Created by Tejeshwar Gill on 08/08/2019.
//  Copyright © 2019 Project GT. All rights reserved.
//

import Foundation

public extension Double {

    /// Returns radians. Distance divided by the WGS-84 equatorial radius. Dubious geodesy.
    var metersToLatitude: Double {
        return self / (6_378_137.0)
    }

    /// Returns radians. Distance divided by the WGS-84 polar radius. Dubious geodesy; invalid except at equator.
    var metersToLongitude: Double {
        return self / (6_356_752.3)
    }
}

public extension Float {
    var short: String { return String(format: "%.2f", self) }
}

public extension Int {
    var short: String { return String(format: "%02d", self) }
    var short3: String { return String(format: "%03d", self / 1_000_000) }
}
