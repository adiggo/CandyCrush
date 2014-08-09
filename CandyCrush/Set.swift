//
//  Set.swift
//  CandyCrush
//
//  Created by Xiaoping Li on 8/7/14.
//  Copyright (c) 2014 edu.jhu.cs.xiaoping. All rights reserved.
//

import Foundation


class Set<T: Hashable>: SequenceType, Printable{
    var dictionary = Dictionary<T, Bool>()
    
    func addElement(newElement: T){
        dictionary[newElement] = true
    }
    func removeElement(element:T){
        dictionary[element] = nil
    }
    
    func containsElement(element:T) ->Bool{
        return dictionary[element] != nil
    }
    
    func allElements() -> [T] {
        return Array(dictionary.keys)
    }
    
    var count: Int{
        return dictionary.count
    }
    
    func unionSet(otherSet: Set<T>) -> Set<T>{
        var combined = Set<T>()
        
        for obj in dictionary.keys{
            combined.dictionary[obj] = true
        }
        
        for obj in otherSet.dictionary.keys{
            combined.dictionary[obj] = true
        }
        return combined
    }
    
    func generate() -> IndexingGenerator<Array<T>> {
        return allElements().generate()
    }
    
    var description: String{
        return dictionary.description
    }
    
    
    
}