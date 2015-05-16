//
//  Array.swift
//  Swift extensions
//
//  Created by Anatoliy Voropay on 5/7/15.
//  Copyright (c) 2015 Smartarium.com. All rights reserved.
//

import Foundation

extension Array {
    
    // MARK: Object managing
    
    /** 
        Will remove object from an array. If there are more than one the same object in array it will remove it also.
    
        :param: object is an object that should conform *Equatable* protocol.
    */
    mutating func removeObject<U: Equatable>(object: U) {
        var index: [Int] = []
        for (idx, objectToCompare) in enumerate(self) {
            if let to = objectToCompare as? U {
                if object == to {
                    index.append(idx)
                    
                }
            }
        }

        var counter: Int = 0
        for i in index {
            self.removeAtIndex(i - counter)
            counter++
        }
    }
    
    /** 
        Will return *true* if array contains object. Object should conform *Equatable* protocol.
    
        :param: object is a given object that will be compared to other objects in our array
    
        :returns: *true* is array contains object
    */
    func contains<T where T : Equatable>(object: T) -> Bool {
        return self.filter({$0 as? T == object}).count > 0
    }
}
