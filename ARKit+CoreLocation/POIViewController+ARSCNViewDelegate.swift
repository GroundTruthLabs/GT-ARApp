//
//  POIViewController+ARSCNViewDelegate.swift
//  GTARKit+CoreLocation
//
// Created by Tejeshwar Gill on 03/10/2019.
//  Copyright © 2019 Project GT. All rights reserved.
//

import ARKit
import UIKit

@available(iOS 11.0, *)
extension POIViewController: ARSCNViewDelegate {

    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        print("Added SCNNode: \(node)")    // you probably won't see this fire
    }

    func renderer(_ renderer: SCNSceneRenderer, willUpdate node: SCNNode, for anchor: ARAnchor) {
        print("willUpdate: \(node)")    // you probably won't see this fire
    }

    func session(_ session: ARSession, cameraDidChangeTrackingState camera: ARCamera) {
        print("Camera: \(camera)")
    }

}
