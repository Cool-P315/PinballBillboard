//
//  GameViewController.swift
//  Pinball Billboard
//
//  Created by Martin Pintar on 26.02.25.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load 'GameScene.sks' as a GKScene
        guard let scene = GKScene(fileNamed: "GameScene"),
              let sceneNode = scene.rootNode as? GameScene else {
            print("Failed to load GameScene.sks")
            return
        }
        
        // Copy gameplay related content over to the scene
        sceneNode.entities = scene.entities
        sceneNode.graphs = scene.graphs
        
        // Set the scale mode to scale to fit the window
        sceneNode.scaleMode = .aspectFill
        
        // Present the scene
        guard let view = self.view as? SKView else {
            print("Failed to cast view to SKView")
            return
        }
        view.presentScene(sceneNode)
        
        view.ignoresSiblingOrder = true
        view.showsFPS = true
        view.showsNodeCount = true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIDevice.current.userInterfaceIdiom == .phone ? .allButUpsideDown : .all
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
