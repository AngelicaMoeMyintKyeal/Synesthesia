//
//  GameController.swift
//  Gamemotion
//
//  Created by Pierpaolo Siciliano on 21/02/23.
//

import SpriteKit
import GameController

class GameController: NSObject, ObservableObject {
    
    private var isJumping = false
    private var isAttacking = false
    
    private var gamePadLeft: GCControllerDirectionPad?
    private var gamePadRight: GCControllerDirectionPad?
    private var gamePadCurrent: GCController?
    
    init(SKScene: SKScene) {
        super.init()
        
        // Set up game controller.
        setupGameController()
    }
    
    func setupGameController() {
        NotificationCenter.default.addObserver(
            self, selector: #selector(self.handleControllerDidConnect),
            name: NSNotification.Name.GCControllerDidBecomeCurrent, object: nil)
        
        NotificationCenter.default.addObserver(
            self, selector: #selector(self.handleControllerDidDisconnect),
            name: NSNotification.Name.GCControllerDidStopBeingCurrent, object: nil)
    }
    
    @objc
    func handleControllerDidConnect(_ notification: Notification) {
        guard let gameController = notification.object as? GCController else {
            return
        }
        print("controller connected")
//        unregisterGameController()
        
        registerGameController(gameController)
        
        /// Show input for the character
        //        self.overlay?.showHints()
    }
    
    @objc
    func handleControllerDidDisconnect(_ notification: Notification) {
        print("controller disconnected")
        unregisterGameController()
    }
    
    func unregisterGameController() {
        gamePadLeft = nil
        gamePadRight = nil
        gamePadCurrent = nil
    }
    
    func registerGameController(_ gameController: GCController) {
        var buttonA: GCControllerButtonInput?
        var buttonB: GCControllerButtonInput?
        var rightTrigger: GCControllerButtonInput?
        
        weak var weakController = self
        
        guard let gamepad = gameController.extendedGamepad else {
            print("Error: the gamepad connected is not an extendedGamepad")
            return
        }
        
        self.gamePadLeft = gamepad.leftThumbstick
        self.gamePadRight = gamepad.rightThumbstick
        buttonA = gamepad.buttonA
        buttonB = gamepad.buttonB
        rightTrigger = gamepad.rightTrigger
        
        buttonA?.pressedChangedHandler = {(_ button: GCControllerButtonInput, _ value: Float, _ pressed: Bool) -> Void in
            guard let strongController = weakController else {
                return
            }
            if pressed {
                strongController.controllerJump(pressed)
            }
        }
        
        buttonB?.valueChangedHandler = {(_ button: GCControllerButtonInput, _ value: Float, _ pressed: Bool) -> Void in
            guard let strongController = weakController else {
                return
            }
            if pressed {
                strongController.controllerAttack()
            }
        }
        
        rightTrigger?.pressedChangedHandler = buttonB?.valueChangedHandler
    }
    
    func controllerJump(_ controllerJump: Bool) {
        isJumping = controllerJump
        print("X button pressed")
    }
    
    func controllerAttack() {
        /// attacking code
//        if !self.character!.isAttacking {
//            self.character!.attack()
//        }
        isAttacking = true
        print("O button pressed")
    }
    
    /// hints
//    func showHints() {
//        guard let gamepad = GCController.current?.extendedGamepad else {
//            return
//        }
//
//        guard let buttonASymbol = gamepad.buttonA.sfSymbolsName,
//              let buttonBSymbol = gamepad.buttonB.sfSymbolsName else {
//            return
//        }
//
//        if let oldHint = self.childNode(withName: "HintNode") {
//            oldHint.removeAllActions()
//            oldHint.removeFromParent()
//        }
//
//        let hintNode = SKNode()
//        hintNode.name = "HintNode"
//
//        let jumpHint = SKLabelNode()
//
//        let fontName: String = "Optima-ExtraBlack"
//        let fontSize: CGFloat = 36
//
//        jumpHint.fontName = fontName
//        jumpHint.fontSize = fontSize
//        jumpHint.fontColor = SKColor.white
//
//        guard let attackHint = jumpHint.copy() as? SKLabelNode else {
//            return
//        }
//
//        attackHint.text = "To attack press: "
//        jumpHint.text = "To jump press: "
//
//        var buttonATexture: SKTexture? = nil
//        var buttonBTexture: SKTexture? = nil
//
//        #if os(macOS)
//        let buttonA = NSImage(systemSymbolName: buttonASymbol, accessibilityDescription: nil)
//        let buttonB = NSImage(systemSymbolName: buttonBSymbol, accessibilityDescription: nil)
//
//        if buttonA != nil && buttonB != nil {
//            buttonATexture = SKTexture(image: buttonA!)
//            buttonBTexture = SKTexture(image: buttonB!)
//        }
//        #else
//        let buttonA = UIImage(systemName: buttonASymbol)
//        let buttonB = UIImage(systemName: buttonBSymbol)
//
//        if buttonA != nil && buttonB != nil {
//            buttonATexture = SKTexture(image: buttonA!)
//            buttonBTexture = SKTexture(image: buttonB!)
//        }
//        #endif
//
//        let buttonANode = SKSpriteNode(texture: buttonATexture)
//        buttonANode.size = CGSize(width: fontSize, height: fontSize)
//        buttonANode.anchorPoint = CGPoint(x: 0, y: 0.25)
//
//        let buttonBNode = SKSpriteNode(texture: buttonBTexture)
//        buttonBNode.size = CGSize(width: fontSize, height: fontSize)
//        buttonBNode.anchorPoint = CGPoint(x: 0, y: 0.25)
//
//        attackHint.position = CGPoint(x: 0, y: 0)
//        buttonBNode.position = CGPoint(x: 145, y: 0)
//        jumpHint.position = CGPoint(x: 0, y: attackHint.frame.height + 10)
//        buttonANode.position = CGPoint(x: 145, y: jumpHint.position.y)
//
//        hintNode.addChild(attackHint)
//        hintNode.addChild(buttonBNode)
//        hintNode.addChild(jumpHint)
//        hintNode.addChild(buttonANode)
//
//        hintNode.position = CGPoint(x: self.size.width / 2, y: 200)
//        hintNode.run(SKAction.sequence([SKAction.wait(forDuration: 2), SKAction.fadeAlpha(to: 0.0, duration: 2), SKAction.removeFromParent()]))
//        self.addChild(hintNode)
//    }
}
