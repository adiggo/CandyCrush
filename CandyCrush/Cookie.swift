//
//  Cookie.swift
//  CandyCrush
//
//  Created by Xiaoping Li on 8/7/14.
//  Copyright (c) 2014 edu.jhu.cs.xiaoping. All rights reserved.
// Cookie can be treated as the model part
//

import Foundation
import SpriteKit

enum CookieType: Int, Printable {
    case Unknown = 0, Croissant, Cupcake, Danish, Donut, Macaroon, SugarCookie
    
    var spriteName: String{
        let spriteNames = [
            "Croissant",
            "Cupcake",
            "Danish",
            "Donut",
            "Macaroon",
            "SugarCookie"]
        return spriteNames[toRaw() - 1]
    }
    
    var highlightedSpriteName: String {
        let highlightedSpriteNames = [
            "Croissant-Highlighted",
            "Cupcake-Highlighted",
            "Danish-Highlighted",
            "Donut-Highlighted",
            "Macaroon-Highlighted",
            "SugarCookie-Highlighted"]
        return highlightedSpriteNames[toRaw() - 1]  //toRaw() convert a enum value to int
    }
    
    var description: String{
        return spriteName
    }
   
    static func random() -> CookieType {
        return CookieType.fromRaw(Int(arc4random_uniform(6)) + 1)!
    }
    
    //calls arc4random_uniform() to generate a random number between 0 and 5.
}

class Cookie: Printable, Hashable{
    var column : Int
    var row : Int
    let cookieType : CookieType
    var sprite : SKSpriteNode?   //add a question mark so that it will not need to init
    
    var description: String{
        return "type:\(cookieType) square:(\(column),\(row))"
    }
    
    var hashValue: Int {
        return row*10 + column
    }
    
    init(column: Int, row:Int, cookieType:CookieType){
        self.column = column
        self.row = row
        self.cookieType = cookieType
    }
}

func ==(lhs: Cookie, rhs: Cookie) -> Bool {
    return lhs.column == rhs.column && lhs.row == rhs.row
}
