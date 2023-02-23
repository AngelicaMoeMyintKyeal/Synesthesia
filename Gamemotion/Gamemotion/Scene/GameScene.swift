//
//  GameScene.swift
//  Gamemotion
//
//  Created by Htet Myat Moe Myint Kyeal on 21/02/23.
//

import Foundation
import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var hero = SKSpriteNode()
    var heroTexture = SKTexture(imageNamed: "Hero")
    
    var rageTileL = SKSpriteNode()
    var rageTileLTexture = SKTexture(imageNamed: "RageTileLarge")
    
    enum bitMasks: UInt32 {
        case hero = 0b1
        case rageTileL = 0b10
    }
    
    override func didMove(to view: SKView) {
        setHero()
        setRageTiles()
    }
    
    func setHero() {
        hero = childNode(withName: "hero") as! SKSpriteNode
        hero.physicsBody = SKPhysicsBody(texture: heroTexture, size: hero.size)
        hero.physicsBody?.categoryBitMask = bitMasks.hero.rawValue
        hero.physicsBody?.contactTestBitMask = bitMasks.rageTileL.rawValue
        hero.physicsBody?.collisionBitMask = bitMasks.rageTileL.rawValue
        hero.physicsBody?.allowsRotation = false
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
