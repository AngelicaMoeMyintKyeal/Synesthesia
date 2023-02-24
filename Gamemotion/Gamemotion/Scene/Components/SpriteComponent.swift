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
    
    // TODO: add a parameter to handle the texture resizing
    init(texture: SKTexture) {
        node = SKSpriteNode(texture: texture)
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func scale(factor: Double) {
        node.size = CGSize(
            width: node.texture!.size().width * factor,
            height: node.texture!.size().height * factor
        )
    }
}
