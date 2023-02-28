//
//  SceneManager.swift
//  Gamemotion
//
//  Created by Pierpaolo Siciliano on 23/02/23.
//

import SpriteKit

class SceneManager: SKScene, SKPhysicsContactDelegate {
    
    var entityManager: EntityManager!
//    var videoSceneManager: VideoSceneManager!
//
//    override func sceneDidLoad() {
//        videoSceneManager.languageForVideo(deviceLang: Locale.current.languageCode ?? "en")
//    }
    
    override func didMove(to view: SKView) {
        entityManager = EntityManager(scene: self)
        
        // Add player
        let player = Player(imageName: "Player")
        if let spriteComponent = player.component(ofType: SpriteComponent.self) {
            spriteComponent.node.position = CGPoint(x: -525,y: -160)
        }
        entityManager.add(player)
        
        // Add platform
        let platform = Platform(imageName: "RageTileSmall")
        if let spriteComponent = platform.component(ofType: SpriteComponent.self) {
            spriteComponent.node.position = CGPoint(x: -525, y: -240)
        }
        entityManager.add(platform)
        
        // Add whatever else
    }
}
