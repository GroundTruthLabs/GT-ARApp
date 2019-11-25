//
//  NotSupportedViewController.swift
//  GTARKit+CoreLocation
//
//  Created by Tejeshwar Gill on 09/02/2019.
//  Copyright © 2019 Project GT. All rights reserved.
//

import UIKit

class NotSupportedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white

        let label = UILabel()
        label.textAlignment = .center
        label.text = "iOS 11+ required"

        self.view.addSubview(label)

        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
}
