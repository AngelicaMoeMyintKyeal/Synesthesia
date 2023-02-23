//
//  Player.swift
//  Gamemotion
//
//  Created by Pierpaolo Siciliano on 23/02/23.
//

import SpriteKit
import GameplayKit

class Player: GKEntity {
    
    init(imageName: String) {
        super.init()
        let texture = SKTexture(imageNamed: imageName)
        
        let spriteComponent = SpriteComponent(texture: texture)
        addComponent(spriteComponent)
        
        let physicsComponent = PhysicsComponent(texture: texture, bitMask: .player)
        addComponent(physicsComponent)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
