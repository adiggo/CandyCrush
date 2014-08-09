//
//  GameScene.swift
//  CandyCrush
//
//  Created by Xiaoping Li on 7/15/14.
//  Copyright (c) 2014 edu.jhu.cs.xiaoping. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var level : Level!
    
    let TileWidth: CGFloat = 32.0
    let TileHeight: CGFloat = 36.0
    
    let gameLayer = SKNode()
    let cookiesLayer = SKNode()
    
    required init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
      //  super.init(size: size)
        setup()
    }
    
    override init(size: CGSize) {
        super.init(size: size)
        setup()
    }
    
    func setup() {
       // super.init(size: size)
        
        anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        let background = SKSpriteNode(imageNamed: "Background")  //drwas a texture image
        addChild(background)
        addChild(gameLayer)
        
        let layerPosition = CGPoint(
            x: -TileWidth * CGFloat(NumColumns)/2,
            y : -TileHeight * CGFloat(NumRows)/2)
        cookiesLayer.position = layerPosition
        gameLayer.addChild(cookiesLayer)
    }
    
    func addSpritesForCookies(cookies: Set<Cookie>) {
        for cookie in cookies {
            let sprite = SKSpriteNode(imageNamed: cookie.cookieType.spriteName)
            sprite.position = pointForColumn(cookie.column, row:cookie.row)
            cookiesLayer.addChild(sprite)
            cookie.sprite = sprite
        }
    }
    
    func pointForColumn(column: Int, row: Int) -> CGPoint {
        return CGPoint(
            x: CGFloat(column)*TileWidth + TileWidth/2,
            y: CGFloat(row)*TileHeight + TileHeight/2)
    }
    
}
