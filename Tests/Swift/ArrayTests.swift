//
//  ArrayTests.swift
//  Swift extensions
//
//  Created by Anatoliy Voropay on 5/7/15.
//  Copyright (c) 2015 Smartarium.com. All rights reserved.
//

import UIKit
import XCTest

class Element: Equatable {
    var id: Int
    init(id: Int) {
        self.id = id
    }
}

func == (lhs: Element, rhs: Element) -> Bool {
    return lhs.id == rhs.id
}

class ArrayTests: XCTestCase {
    var testElement: Element = Element(id: 5)
    var arrayWithElement: [Element] = []
    var arrayWithoutElement: [Element] = []

    override func setUp() {
        super.setUp()
        
        arrayWithElement = [Element(id: 1), Element(id: 2), Element(id: 3), testElement, Element(id: 4), testElement]
        arrayWithoutElement = [Element(id: 1), Element(id: 2), Element(id: 3), Element(id: 4)]
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testContans() {
        XCTAssertTrue(arrayWithElement.contains(testElement), "Failed")
        XCTAssertFalse(arrayWithoutElement.contains(testElement), "Failed")
    }

    func testRemoveElement() {
        var array = arrayWithElement
        var itemsCounter = array.count

        array.removeObject(testElement)
        
        XCTAssertFalse(array.contains(testElement), "Failed")
        XCTAssertFalse(array.count != itemsCounter - 2, "Failed")
    }

}
