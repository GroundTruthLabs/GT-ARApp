//
//  Utils.swift
//  GTARKit+CoreLocation
//
//  Created by Tejeshwar Gill on 03/10/2019.
//  Copyright © 2019 Project GT. All rights reserved.
//

import UIKit

class Utils {
    fileprivate init () { }

    class func getStoryboard(_ storyboard: String = "Main") -> UIStoryboard {
        return UIStoryboard(name: storyboard, bundle: Bundle.main)
    }

    class func createViewController<T: UIViewController>(_ identifier: String, storyboard: String = "Main") -> T {
        return Utils.getStoryboard(storyboard)
            .instantiateViewController(withIdentifier: identifier) as! T // swiftlint:disable:this force_cast
    }
}
