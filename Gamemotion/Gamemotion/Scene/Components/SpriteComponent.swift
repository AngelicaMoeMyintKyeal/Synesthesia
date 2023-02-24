//
//  SpriteComponent.swift
//  Gamemotion
//
//  Created by Pierpaolo Siciliano on 22/02/23.
//

import SpriteKit
import GameplayKit

class SpriteComponent: GKComponent {
    
    let node: SKSpriteNode
    
    init(texture: SKTexture, scaleFactor: Double = 1.0) {
        node = SKSpriteNode(texture: texture)
        if scaleFactor != 1.0 {
            node.setScale(CGFloat(scaleFactor))
        }
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
