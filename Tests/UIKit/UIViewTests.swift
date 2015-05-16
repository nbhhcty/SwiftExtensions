//
//  UIView.swift
//  Swift extensions
//
//  Created by Anatoliy Voropay on 5/9/15.
//  Copyright (c) 2015 Smartarium.com. All rights reserved.
//

import UIKit
import XCTest

class UIViewTests: XCTestCase {

    var currentView = UIView(frame: CGRectMake(12, 24, 36, 48))
    
    // MARK: Easily get frames parameters
    
    func testWidth() {
        XCTAssertFalse(currentView.width != 36, "Failed")
    }
    
    func testHeight() {
        XCTAssertFalse(currentView.height != 48, "Failed")
    }
    
    func testX() {
        XCTAssertFalse(currentView.x != 12, "Failed")
    }
    
    func testY() {
        XCTAssertFalse(currentView.y != 24, "Failed")
    }

    func testCenterX() {
        XCTAssertFalse(currentView.center.x != 12 + 36 / 2, "Failed")
    }
    
    func testCenterY() {
        XCTAssertFalse(currentView.center.y != 24 + 48 / 2, "Failed")
    }

    // MARK: Easily update frames parameters
    
    func testSetWidth() {
        currentView.setWidth(1)
        XCTAssertFalse(currentView.width != 1, "Failed")
    }
    
    func testSetHeight() {
        currentView.setHeight(1)
        XCTAssertFalse(currentView.height != 1, "Failed")
    }
    
    func testSetX() {
        currentView.setX(1)
        XCTAssertFalse(currentView.x != 1, "Failed")
    }
    
    func testSetY() {
        currentView.setY(1)
        XCTAssertFalse(currentView.y != 1, "Failed")
    }
    
    func testSetCenterX() {
        currentView.setCenterX(1)
        XCTAssertFalse(currentView.center.x != 1, "Failed")
    }
    
    func testSetCenterY() {
        currentView.setCenterY(1)
        XCTAssertFalse(currentView.center.y != 1, "Failed")
    }
}
