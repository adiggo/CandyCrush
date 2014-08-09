//
//  Array2D.swift
//  CandyCrush
//
//  Created by Xiaoping Li on 8/7/14.
//  Copyright (c) 2014 edu.jhu.cs.xiaoping. All rights reserved.
//

import Foundation


class Array2D<T>{
    let columns: Int
    let rows: Int
    var array: Array<T?>  //private
    
    init(columns:Int, rows:Int){
        self.columns = columns
        self.rows = rows
        array = Array<T?>(count: rows*columns, repeatedValue:nil)
    }
    
    subscript(column: Int, row: Int) -> T?{
        get{
            return array[row*columns + column]
        }
        set{
            array[row*columns + column] = newValue
        }
    }
}
