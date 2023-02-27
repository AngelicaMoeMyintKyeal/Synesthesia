//
//  VideoSceneManager.swift
//  Gamemotion
//
//  Created by Htet Myat Moe Myint Kyeal on 27/02/23.
//

import Foundation
import SpriteKit

class VideoSceneManager: SKNode {
    
    var entityManager: EntityManager!
    
    func playPrologueVideo() {
        let prologueVideo = SKVideoNode(fileNamed: "Prologue.mov")
        prologueVideo.position = CGPoint(x: frame.midX, y: frame.midY)
        addChild(prologueVideo)
        prologueVideo.play()
    }
    
}
