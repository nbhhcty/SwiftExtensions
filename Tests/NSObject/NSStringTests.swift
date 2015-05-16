//
//  NSStringTests.swift
//  Swift extensions
//
//  Created by Anatoliy Voropay on 5/7/15.
//  Copyright (c) 2015 Smartarium.com. All rights reserved.
//

import Foundation
import XCTest

class NSStringTests: XCTestCase {

    func testExample() {
        XCTAssertFalse(NSString.isEmailValid("not valid@gmail.com") == true, "Failed")
        XCTAssertFalse(NSString.isEmailValid("this is not valid @gmail.com") == true, "Failed")
        XCTAssertFalse(NSString.isEmailValid("notvalid@gmail") == true, "Failed")
        XCTAssertFalse(NSString.isEmailValid("notvalid@gmail.") == true, "Failed")
        XCTAssertFalse(NSString.isEmailValid("notvalid@gmail.c") == true, "Failed")
        XCTAssertFalse(NSString.isEmailValid("notvalid@@gmail.com") == true, "Failed")
        
        XCTAssertFalse(NSString.isEmailValid("valid@gmail.co") == false, "Failed")
        XCTAssertFalse(NSString.isEmailValid("va_lid@gmail.com") == false, "Failed")
        XCTAssertFalse(NSString.isEmailValid("valid123@gmail.com") == false, "Failed")
        XCTAssertFalse(NSString.isEmailValid("valid_123@gmail.com") == false, "Failed")
        XCTAssertFalse(NSString.isEmailValid("valid-123@gmail.com") == false, "Failed")
    }

}
