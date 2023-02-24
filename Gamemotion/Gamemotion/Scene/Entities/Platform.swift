//
//  Platform.swift
//  Gamemotion
//
//  Created by Pierpaolo Siciliano on 23/02/23.
//

import SpriteKit
import GameplayKit

class Platform: GKEntity {
    
    init(imageName: String) {
        super.init()
        let texture = SKTexture(imageNamed: imageName)
        
        let spriteComponent = SpriteComponent(texture: texture, scaleFactor: 0.2)
        addComponent(spriteComponent)
        
        let physicsComponent = PhysicsComponent(
            node: spriteComponent.node,
            category: .ground,
            contact: .player,
            collision: .player
        )
        physicsComponent.physics.affectedByGravity = false
        physicsComponent.physics.isDynamic = false
        addComponent(physicsComponent)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
