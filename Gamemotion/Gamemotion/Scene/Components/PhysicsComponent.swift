//
//  PhysicsComponent.swift
//  Gamemotion
//
//  Created by Pierpaolo Siciliano on 23/02/23.
//

import SpriteKit
import GameplayKit

class PhysicsComponent: GKComponent {
    
    let physics: SKPhysicsBody
    
    enum bitMasks: UInt32 {
        case player = 0b1
        case ground = 0b10
    }

    init(texture: SKTexture, category: bitMasks, contact: bitMasks, collision: bitMasks) {
        physics = SKPhysicsBody(texture: texture, size: texture.size())
        physics.categoryBitMask = category.rawValue
        physics.contactTestBitMask = contact.rawValue
        physics.collisionBitMask = collision.rawValue
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
