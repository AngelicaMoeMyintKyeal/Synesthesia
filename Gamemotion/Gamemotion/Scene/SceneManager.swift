//
//  SceneManager.swift
//  Gamemotion
//
//  Created by Pierpaolo Siciliano on 23/02/23.
//

import SpriteKit

class SceneManager: SKScene, SKPhysicsContactDelegate {
    
    var entityManager: EntityManager!
    
    override func didMove(to view: SKView) {
        entityManager = EntityManager(scene: self)
        
        // Add player
        let player = Player(imageName: "Player")
        if let spriteComponent = player.component(ofType: SpriteComponent.self) {
            spriteComponent.node.position = CGPoint(x: -525,y: -160)
            spriteComponent.scale(factor: 0.03)
        }
        entityManager.add(player)
        
        // Add platform
        let platform = Platform(imageName: "RageTileSmall")
        if let spriteComponent = platform.component(ofType: SpriteComponent.self) {
            spriteComponent.node.position = CGPoint(x: -525, y: -240)
            spriteComponent.scale(factor: 0.02)
        }
        entityManager.add(platform)
        
        // Add whatever else
    }
}
