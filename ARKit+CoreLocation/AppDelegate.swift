//
//  AppDelegate.swift
//  GTARKit+CoreLocation
//
//  Created by Tejeshwar Gill on 02/09/2019.
//  Copyright © 2019 Project GT. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions
        launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {

        UIApplication.shared.isIdleTimerDisabled = true

        self.window = UIWindow(frame: UIScreen.main.bounds)

        self.window!.makeKeyAndVisible()

        if #available(iOS 11.0, *) {
            guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() else {
                return false
            }
            self.window!.rootViewController = vc
        } else {
            self.window!.rootViewController = NotSupportedViewController()
        }

        return true
    }

}
