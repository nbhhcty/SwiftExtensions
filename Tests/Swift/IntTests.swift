//
//  Int.swift
//  Swift extensions
//
//  Created by Anatoliy Voropay on 5/7/15.
//  Copyright (c) 2015 Smartarium.com. All rights reserved.
//

import Foundation
import XCTest

class IntTests: XCTestCase {
    
    // MARK: Working with numbers
    
    func testIsEven() {
        XCTAssertFalse(12.isEven == false, "Failed")
        XCTAssertFalse(11.isEven == true, "Failed")
        XCTAssertFalse(0.isEven == false, "Failed")
    }
    
    func testIsOdd() {
        XCTAssertFalse(12.isOdd == true, "Failed")
        XCTAssertFalse(11.isOdd == false, "Failed")
        XCTAssertFalse(0.isOdd == true, "Failed")
    }
    
    func testIsPositive() {
        XCTAssertFalse(12.isPositive == false, "Failed")
        XCTAssertFalse((-12).isPositive == true, "Failed")
        XCTAssertFalse(0.isPositive == true, "Failed")
    }
    
    func testIsNegative() {
        XCTAssertFalse(12.isNegative == true, "Failed")
        XCTAssertFalse((-12).isNegative == false, "Failed")
        XCTAssertFalse(0.isNegative == true, "Failed")
    }
    
    func testIsZero() {
        XCTAssertFalse(12.isZero == true, "Failed")
        XCTAssertFalse((-12).isZero == true, "Failed")
        XCTAssertFalse(0.isZero == false, "Failed")
    }
    
    func testIsPOZ() {
        XCTAssertFalse(12.isPOZ == false, "Failed")
        XCTAssertFalse((-12).isPOZ == true, "Failed")
        XCTAssertFalse(0.isPOZ == false, "Failed")
    }
    
    // MARK: Useful
    
    func testTimes() {
        var i: Int = 10
        var counter: Int = 0
        i.times {
            counter++
        }
        
        XCTAssertEqual(i, counter, "Failed")
    }
}
