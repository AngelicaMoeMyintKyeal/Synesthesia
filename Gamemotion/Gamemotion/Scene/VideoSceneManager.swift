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
    var deviceLanguage = Locale.current.languageCode

    func languageForVideo(deviceLang: String) {
        switch deviceLang {
        case ParameterConstants.englishLanguage:
            playPrologueVideo(fileName: ParameterConstants.englishPrologueVid)
        case ParameterConstants.italianLanguage:
            playPrologueVideo(fileName: ParameterConstants.italianPrologueVid)
        case ParameterConstants.koreanLanguage:
            playPrologueVideo(fileName: ParameterConstants.koreanPrologueVid)
        default:
            playPrologueVideo(fileName: ParameterConstants.englishPrologueVid)
        }
    }
    
    func playPrologueVideo(fileName: String) {
        let prologueVideo = SKVideoNode(fileNamed: fileName)
        prologueVideo.position = CGPoint(x: frame.midX, y: frame.midY)
        addChild(prologueVideo)
        prologueVideo.play()
    }
    
}
