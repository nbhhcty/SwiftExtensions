//
//  StringTests.swift
//  Swift extensions
//
//  Created by Anatoliy Voropay on 6/25/15.
//  Copyright (c) 2015 Smartarium.com. All rights reserved.
//

import UIKit
import XCTest

class StringTests: XCTestCase {
    
    func testTrim() {
        XCTAssertFalse("  \nabc \n ".trim() != "abc", "trim() failed")
    }
    
    func testLength() {
        XCTAssertFalse("".length() != 0, "length() failed")
        XCTAssertFalse("1".length() != 1, "length() failed")
        XCTAssertFalse("ab\ncd".length() != 5, "length() failed")
    }
    
    func testSubstring() {
        XCTAssertFalse("abcd".substring(0, length: 1) != "a", "substring() failed")
        XCTAssertFalse("abcd".substring(0, length: 0) != "", "substring() failed")
        XCTAssertFalse("abcd".substring(0, length: 3) != "abc", "substring() failed")
        XCTAssertFalse("abcd".substring(1, length: 2) != "bc", "substring() failed")
    }
    
    func testSubscript() {
        XCTAssertFalse("abs"[0] != "a", "Subscript failed")
        XCTAssertFalse("abs"[1] != "b", "Subscript failed")
        XCTAssertFalse("abs"[-1] != "s", "Subscript failed")
        XCTAssertFalse("abs"[-2] != "b", "Subscript failed")
        XCTAssertFalse("abs"[-5] != "b", "Subscript failed")
    }

    func testLocation() {
        XCTAssertFalse("abcd".location("b") != 1, "location() failed")
        XCTAssertFalse("abcd".location("abc") != 0, "location() failed")
        XCTAssertFalse("aabcd".location("abc") != 1, "location() failed")
        XCTAssertFalse("abcd".location("f") != NSNotFound, "location() failed")
    }
    
    func testContains() {
        XCTAssertFalse("abcd".contains("b") != true, "contains() failed")
        XCTAssertFalse("abcd".contains("abc") != true, "contains() failed")
        XCTAssertFalse("abcd".contains("f") != false, "contains() failed")
    }
    
    func testIsNumeric() {
        XCTAssertFalse("abcd".isNumeric() != false, "isNumeric() failed")
        XCTAssertFalse("123".isNumeric() != true, "isNumeric() failed")
        XCTAssertFalse("123 234".isNumeric() != false, "isNumeric() failed")
        XCTAssertFalse(" 123".isNumeric() != false, "isNumeric() failed")
    }
}
