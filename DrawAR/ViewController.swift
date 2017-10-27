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
    }
}

