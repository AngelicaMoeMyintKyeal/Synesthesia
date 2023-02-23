//
//  SceneManager.swift
//  Gamemotion
//
//  Created by Pierpaolo Siciliano on 23/02/23.
//

import SpriteKit

class SceneManager: SKScene, SKPhysicsContactDelegate {
    
    // code from GameScene
    var rageTileL = SKSpriteNode()
    var rageTileLTexture = SKTexture(imageNamed: "RageTileLarge")

    enum bitMasks: UInt32 {
        case hero = 0b1
        case rageTileL = 0b10
    }
    
    var entityManager: EntityManager!
    
    override func didMove(to view: SKView) {
        entityManager = EntityManager(scene: self)
        
        // Add player
        let player = Player(imageName: "Hero")
        if let spriteComponent = player.component(ofType: SpriteComponent.self) {
            spriteComponent.node.position = CGPoint(
                x: -525,
                y: -160
            )
            spriteComponent.node.size = CGSize(width: 31, height: 31)
        }
        entityManager.add(player)
        
        // Add whatever else

        // code from GameScene
        setRageTiles()
    }

    func setRageTiles() {
        rageTileL = childNode(withName: "rageTileL") as! SKSpriteNode
        rageTileL.physicsBody = SKPhysicsBody(texture: rageTileLTexture, size: rageTileL.size)
        rageTileL.physicsBody?.categoryBitMask = bitMasks.rageTileL.rawValue
        rageTileL.physicsBody?.contactTestBitMask = bitMasks.hero.rawValue
        rageTileL.physicsBody?.collisionBitMask = bitMasks.hero.rawValue
        rageTileL.physicsBody?.affectedByGravity = false
        rageTileL.physicsBody?.isDynamic = false
        rageTileL.physicsBody?.friction = 1
        rageTileL.zPosition = 20
    }
}
