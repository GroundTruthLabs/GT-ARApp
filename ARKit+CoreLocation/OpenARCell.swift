//
//  OpenARCell.swift
//  GTARKit+CoreLocation
//
// Created by Tejeshwar Gill on 03/10/2019.
//  Copyright © 2019 Project GT. All rights reserved.
//

import UIKit

@available(iOS 11.0, *)
class OpenARCell: UITableViewCell {

    weak var parentVC: SettingsViewController?
    @IBOutlet weak var openARButton: UIButton!

    @IBAction
    func tappedOpenARButton(_ sender: Any) {
        guard let vc = parentVC?.createARVC() else {
            return assertionFailure("Failed to create ARVC")
        }
        parentVC?.navigationController?.pushViewController(vc, animated: true)
    }

}
