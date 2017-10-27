//
//  ViewController.swift
//  DrawAR
//
//  Created by Tewodros Wondimu on 10/27/17.
//  Copyright © 2017 Tewodros Wondimu. All rights reserved.
//

import UIKit
import ARKit

// By inheriting from ARSCNViewDelegate, it allows to get the renderer delete
class ViewController: UIViewController, ARSCNViewDelegate {
    @IBOutlet weak var sceneView: ARSCNView!
    
    let configuration = ARWorldTrackingConfiguration()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.sceneView.debugOptions = [ARSCNDebugOptions.showWorldOrigin, ARSCNDebugOptions.showFeaturePoints]
        
        // Makes sceneview display performance statistics
        self.sceneView.showsStatistics = true
        
        // Makes self the delegate of the ARSCNViewDelegate
        self.sceneView.delegate = self
        
        self.sceneView.session.run(configuration)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Will be called everytime the scene is rendering
    func renderer(_ renderer: SCNSceneRenderer, willRenderScene scene: SCNScene, atTime time: TimeInterval) {
        print("Rendering")
        
        // the current location and orientation of the camera view
        guard let pointOfView = sceneView.pointOfView else {return}
        
        // the location and orientation are encoded in a transform matrix
        let transform = pointOfView.transform
        
        // Orientation is where your phone is facing
        // extract the orientation from the tranform matrix
        // the third column in the transform matrix is the orientation
        // x is located in row 1
        // y is located in row 2
        // z is located in row 3
        // When trying to see the value for orientation, you'll find looking up give you a -ve value, switch that by multiplying the transform matrix by -ve
        let orientation = SCNVector3(-transform.m31,-transform.m32,-transform.m33)
        
        // Location is where your phone is located relative to the sceneView and how it's moving transitionally
        // location is also a 3d field
        // the fourth column in the tranform matrix is the location
        // x is located in row 1
        // y is located in row 2
        // z is located in row 3
        let location = SCNVector3(transform.m41, transform.m42, transform.m43)
        
        // to get the current position we combine the orientation and location
        let currentPositionOfCamera = orientation + location
        print(orientation.x, orientation.y, orientation.z)
    }
}

// Modifies the binary operator + to add two SCNVector3s and create one SCNVector3
func +(left: SCNVector3, right: SCNVector3) -> SCNVector3 {
    return SCNVector3Make(left.x + right.x, left.y + right.y, left.z + right.z)
}
