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
            
            let originalWidth = spriteComponent.node.texture!.size().width
            let originalHeight = spriteComponent.node.texture!.size().height
            spriteComponent.node.size = CGSize(
                width: originalWidth / 31,
                height: originalHeight / 31)
        }
        entityManager.add(player)
        
        // Add platform
        let platform = Platform(imageName: "RageTileSmall")
        if let spriteComponent = platform.component(ofType: SpriteComponent.self) {
            spriteComponent.node.position = CGPoint(x: -525, y: -240)
            
            let originalWidth = spriteComponent.node.texture!.size().width
            let originalHeight = spriteComponent.node.texture!.size().height
            spriteComponent.node.size = CGSize(
                width: originalWidth / 4,
                height: originalHeight / 4)
        }
        entityManager.add(platform)
        
        // Add whatever else
    }

//    func setRageTiles() {
//        rageTileL = childNode(withName: "rageTileL") as! SKSpriteNode
//        rageTileL.physicsBody = SKPhysicsBody(texture: rageTileLTexture, size: rageTileL.size)
//        rageTileL.physicsBody?.categoryBitMask = bitMasks.ground.rawValue
//        rageTileL.physicsBody?.contactTestBitMask = bitMasks.player.rawValue
//        rageTileL.physicsBody?.collisionBitMask = bitMasks.player.rawValue
//        rageTileL.physicsBody?.affectedByGravity = false
//        rageTileL.physicsBody?.isDynamic = false
//    }
}
