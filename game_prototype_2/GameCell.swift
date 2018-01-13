//
//  CollectionViewCell.swift
//  game_prototype_2
//
//  Created by Tenny on 11/01/18.
//  Copyright © 2018 Tenny. All rights reserved.
//

import UIKit
import SpriteKit

class GameCell: UICollectionViewCell {


    @IBOutlet weak var myskview: SKView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        if let scene = SKScene(fileNamed: "MyScene") as? MyScene{
            scene.scaleMode = .aspectFill
            myskview.presentScene(scene)
    
        }
        
    }

    
    

}
