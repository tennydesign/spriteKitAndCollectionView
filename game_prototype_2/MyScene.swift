//
//  MyScene.swift
//  game_prototype_2
//
//  Created by Tenny on 11/01/18.
//  Copyright © 2018 Tenny. All rights reserved.
//

import Foundation
import SpriteKit

class MyScene: SKScene {
    var gameLabel: SKLabelNode!
    var monthValue: String?
    var bird: SKSpriteNode?
    var floor: SKSpriteNode?
    var bgColor: UIColor?
    let birdCategory: UInt32 = 0x1 << 0
    let floorCategory: UInt32 = 0x1 << 1
    
    override func didMove(to view: SKView) {
        gameLabel = scene?.childNode(withName: "gameLabel") as! SKLabelNode

        //bird
        bird = self.childNode(withName: "bird") as? SKSpriteNode
        bird?.physicsBody = SKPhysicsBody(circleOfRadius: bird!.size.width/2)
        bird?.physicsBody?.linearDamping = 0
        bird?.physicsBody?.collisionBitMask = floorCategory
        bird?.physicsBody?.categoryBitMask = birdCategory
        bird?.physicsBody?.restitution = 0.7
        bird?.physicsBody?.mass = 0.9 ///maybe
        //floor
        floor = self.childNode(withName: "floor") as? SKSpriteNode
        floor?.physicsBody = SKPhysicsBody(rectangleOf: floor!.size)
        floor?.physicsBody?.linearDamping = 0
        floor?.physicsBody?.categoryBitMask = floorCategory
        floor?.physicsBody?.affectedByGravity = false
        floor?.physicsBody?.isDynamic = false

    }
    
    
    
}
