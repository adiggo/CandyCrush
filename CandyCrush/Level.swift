//
//  Level.swift
//  CandyCrush
//
//  Created by Xiaoping Li on 8/7/14.
//  Copyright (c) 2014 edu.jhu.cs.xiaoping. All rights reserved.
//

import Foundation

let NumColumns = 9
let NumRows = 9
//no hardcode
class Level {
    let cookies = Array2D<Cookie>(columns: NumColumns, rows: NumRows)
    
    func cookieAtColumn(column: Int, row:Int) -> Cookie? {
        assert(column >= 0 && column < NumColumns)
        assert(row >= 0 && row < NumRows)
        return cookies[column, row]
    }
    
    func shuffle() -> Set<Cookie> {
        return createInitialCookies()
    }
    // 0,0 is the bottom left
    func createInitialCookies() -> Set<Cookie>{
        var set = Set<Cookie>()
        
        for row in 0..<NumRows {
            for column in 0..<NumColumns {
                var cookieType = CookieType.random()
                
                let cookie = Cookie(column: column, row: row, cookieType: cookieType)
                cookies[column, row] = cookie
                
                set.addElement(cookie)
            }
        }
        return set
    }
    
}



