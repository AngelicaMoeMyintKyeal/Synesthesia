//
//  ContentView.swift
//  Gamemotion
//
//  Created by Htet Myat Moe Myint Kyeal on 15/02/23.
//

import SwiftUI
import SpriteKit

struct ContentView: View {
    @StateObject var gameController = GameController(SKScene: SKScene(fileNamed: "Level0")!)
    var scene = SKScene(fileNamed: "Level0")!
    
    var body: some View {
        SpriteView(scene: self.scene)
            .frame(width: 1200, height: 600)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
