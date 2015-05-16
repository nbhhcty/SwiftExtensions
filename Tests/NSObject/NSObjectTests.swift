//
//  NSObjectTests.swift
//  Swift extensions
//
//  Created by Anatoliy Voropay on 5/7/15.
//  Copyright (c) 2015 Smartarium.com. All rights reserved.
//

import Foundation
import XCTest

class NSObjectTests: XCTestCase {

    func testDelay() {
        var delay: Double = 1
        var expectations: XCTestExpectation = self.expectationWithDescription("Launched")
        
        NSDate().delay(delay, closure: { () -> () in
            expectations.fulfill()
        })
        
        self.waitForExpectationsWithTimeout(delay + 0.1, handler: { (error) -> Void in })
    }

}
