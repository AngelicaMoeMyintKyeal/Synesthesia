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

    init(texture: SKTexture, bitMask: bitMasks) {
        physics = SKPhysicsBody(texture: texture, size: texture.size())
        physics.categoryBitMask = bitMask.rawValue
        physics.contactTestBitMask = bitMasks.ground.rawValue
        physics.collisionBitMask = bitMasks.ground.rawValue
        super.init()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
