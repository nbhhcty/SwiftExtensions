//
//  NSFileManagerTests.swift
//  Swift extensions
//
//  Created by Anatoliy Voropay on 5/9/15.
//  Copyright (c) 2015 Smartarium.com. All rights reserved.
//

import XCTest

class NSFileManagerTests: XCTestCase {

    func testFileSizeAtPath() {
        XCTAssertFalse(NSFileManager.defaultManager().fileSizeAtPath("fake_path") != 0, "Failed")
        
        // TODO: Add more tests
    }

}
