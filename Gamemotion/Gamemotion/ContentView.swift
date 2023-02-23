//
//  ContentView.swift
//  Gamemotion
//
//  Created by Htet Myat Moe Myint Kyeal on 15/02/23.
//

import SwiftUI
import SpriteKit

struct ContentView: View {
    @StateObject var gameController = GameController(scene: SKScene(fileNamed: "RageScene")!)
    var rageScene = SKScene(fileNamed: "RageScene")!
    
    var scene: SKScene {
        let scene = self.rageScene
            scene.size = CGSize(width: 1200, height: 600)
            scene.scaleMode = .fill
            return scene
        }
    
    var body: some View {
        SpriteView(scene: self.scene)
        
        /// for debugging option
        /*
         SpriteView(scene: self.scene, debugOptions: [.showsFPS, .showsPhysics])
         */
            .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
