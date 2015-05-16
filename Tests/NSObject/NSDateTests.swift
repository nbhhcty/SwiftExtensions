//
//  NSDateTests.swift
//  Swift extensions
//
//  Created by Anatoliy Voropay on 5/7/15.
//  Copyright (c) 2015 Smartarium.com. All rights reserved.
//

import Foundation
import XCTest

class NSDateTests: XCTestCase {
    
    // MARK: Working with NSDate-s 
    
    func testIsTheSameDay() {
        var dateBefore = NSDate(timeIntervalSinceNow: -3600 * 24 - 10)
        var dateBefore2 = NSDate(timeIntervalSinceNow: -3600 * 24 - 10 - 10)
        
        var dateAfter = NSDate(timeIntervalSinceNow: 3600 * 24 + 10)
        var dateAfter2 = NSDate(timeIntervalSinceNow: 3600 * 24 + 10 + 10)
        
        XCTAssertFalse(NSDate().isTheSameDay(NSDate()) == false, "Failed")
        XCTAssertFalse(dateBefore.isTheSameDay(NSDate()) == true, "Failed")
        XCTAssertFalse(dateAfter.isTheSameDay(NSDate()) == true, "Failed")
        XCTAssertFalse(dateBefore.isTheSameDay(dateBefore2) == false, "Failed")
        XCTAssertFalse(dateAfter.isTheSameDay(dateAfter2) == false, "Failed")
    }
    
    // MARK: Time intervals

    func testHourlyTimingString() {
        XCTAssertFalse(NSDate.hourlyTimingString(0) != "00:00", "Failed")
        XCTAssertFalse(NSDate.hourlyTimingString(1) != "00:01", "Failed")
        XCTAssertFalse(NSDate.hourlyTimingString(60) != "01:00", "Failed")
        XCTAssertFalse(NSDate.hourlyTimingString(3600 - 1) != "59:59", "Failed")
        XCTAssertFalse(NSDate.hourlyTimingString(3600) != "1:00:00", "Failed")
        XCTAssertFalse(NSDate.hourlyTimingString(3600 + 1) != "1:00:01", "Failed")
        XCTAssertFalse(NSDate.hourlyTimingString(3600 * 13 + 1) != "13:00:01", "Failed")

        XCTAssertFalse(NSDate.hourlyTimingString(-3600) != "-1:00:00", "Failed")
        XCTAssertFalse(NSDate.hourlyTimingString(-65) != "-01:05", "Failed")
        XCTAssertFalse(NSDate.hourlyTimingString(nil) != "00:00", "Failed")
    }
    
    // MARK: Readable dates and time intervals

    func testReadableDate() {
        XCTAssertFalse(NSDate.readableTimeInterval(NSDate(timeIntervalSinceNow:-60)) != "1 minute ago", "Failed")
        XCTAssertFalse(NSDate.readableTimeInterval(NSDate(timeIntervalSinceNow:-60 * 3)) != "3 minutes ago", "Failed")
        
        XCTAssertFalse(NSDate.readableTimeInterval(NSDate(timeIntervalSinceNow:-3600 - 10)) != "1 hour ago", "Failed")
        XCTAssertFalse(NSDate.readableTimeInterval(NSDate(timeIntervalSinceNow:-3600 * 5 - 10)) != "5 hours ago", "Failed")
        
        XCTAssertFalse(NSDate.readableTimeInterval(NSDate(timeIntervalSinceNow:-3600 * 24 - 10)) != "1 day ago", "Failed")
        XCTAssertFalse(NSDate.readableTimeInterval(NSDate(timeIntervalSinceNow:-3600 * 24 * 5 - 10)) != "5 days ago", "Failed")
        
        XCTAssertFalse(NSDate.readableTimeInterval(NSDate(timeIntervalSinceNow:-3600 * 24 * 31 - 10)) != "1 month ago", "Failed")
        XCTAssertFalse(NSDate.readableTimeInterval(NSDate(timeIntervalSinceNow:-3600 * 24 * 31 * 5 - 10)) != "5 months ago", "Failed")
        
        XCTAssertFalse(NSDate.readableTimeInterval(NSDate(timeIntervalSinceNow:-3600 * 24 * 365 - 10)) != "1 year ago", "Failed")
        XCTAssertFalse(NSDate.readableTimeInterval(NSDate(timeIntervalSinceNow:-3600 * 24 * 365 * 5 - 10)) != "5 years ago", "Failed")
    }
    
    func testReadableTimeInterval() {
        // TODO: Add tests
    }
}
