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
    
    enum bitMasks: UInt32 {
        case hero = 0b1
        case ground = 0b10
    }
    
    override func didMove(to view: SKView) {
        addHero()
    }
    
    func addHero() {
        hero = childNode(withName: "hero") as! SKSpriteNode
        hero.physicsBody = SKPhysicsBody(texture: heroTexture, size: hero.size)
        hero.physicsBody?.categoryBitMask = bitMasks.hero.rawValue
        hero.physicsBody?.contactTestBitMask = bitMasks.ground.rawValue
        hero.physicsBody?.collisionBitMask = bitMasks.ground.rawValue
    }
}
