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
        let player = Player(imageName: "hero")
        if let spriteComponent = player.component(ofType: SpriteComponent.self) {
            spriteComponent.node.position = CGPoint(
                x: spriteComponent.node.size.width/2,
                y: size.height/2
            )
        }
        entityManager.add(player)
        
        // Add whatever else
    }
}
