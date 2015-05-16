//
//  NSDate.swift
//  Swift extensions
//
//  Created by Anatoliy Voropay on 5/7/15.
//  Copyright (c) 2015 Smartarium.com. All rights reserved.
//

import Foundation

extension NSDate {
    
    // MARK: Working with NSDate-s 
    
    /** 
        Will return *true* if dates is the same calendar day.
    
        :param: date is NSDate that will be compared with current NSDate
    
        :returns: true if it's the same date or false otherwise
    */
    func isTheSameDay(date: NSDate) -> Bool {
        var calendar: NSCalendar = NSCalendar.currentCalendar()
        var unitFlags = NSCalendarUnit.CalendarUnitYear | NSCalendarUnit.CalendarUnitMonth | NSCalendarUnit.CalendarUnitDay
        
        var comp1: NSDateComponents = calendar.components(unitFlags, fromDate: self)
        var comp2: NSDateComponents = calendar.components(unitFlags, fromDate: date)
        
        return comp1.day == comp2.day && comp1.month == comp2.month && comp1.year == comp2.year
    }
    
    // MARK: Time intervals
    
    /** 
        Will return readable time intervals for short period of times (less than one hour) in 
        format *hh:mm:ss* where *hh* is hours, *mm* is minutes and *ss* is seconds. If time interval is negative will
        return the same value but with *-* sign in the begining. 
    
        If timeInterval is NaN will return *00:00*
    
        The best for use for time intervals less than one day.
    
        :param: timeInterval is a given time interval
    
        :returns: String in current format
    */
    class func hourlyTimingString(timeInterval: NSTimeInterval?) -> String {
        let unrecognizedString = "00:00"
        
        if timeInterval?.isNaN == true {
            return unrecognizedString
        }
        
        if let timeInterval = timeInterval {
            var prefix = ""
            var interval: Int = Int(timeInterval)
            
            if interval < 0 {
                prefix = "-"
                interval *= -1
            }
            
            var seconds: Int = interval % 60
            var minutes: Int = (interval / 60) % 60
            var hours: Int = (interval / 60 / 60) % 60
            
            if hours > 0 {
                return String(format: "\(prefix)%ld:%02ld:%02ld", hours, minutes, seconds)
            } else {
                return String(format: "\(prefix)%02ld:%02ld", minutes, seconds)
            }
        } else {
            return unrecognizedString
        }
    }
    
    // MARK: Readable dates and time intervals
    
    /** 
        Will return readable time intervals for past dates. Few possible outputs that can describe how it works:
        
        * less than minute
        * 1 minute ago
        * 6 minutes ago
        * 4 hours ago
        * 2 days ago
        * 1 month ago
        * 245 years ago
    
        For future dates will return *soon*
    
        :param: date is a NSDate that will be used to create readable string
    
        :returns: String in human readable format
    */
    class func readableTimeInterval(date: NSDate) -> String {
        let timeInterval = NSDate().timeIntervalSinceDate(date)
        
        if timeInterval < 0 {
            return "soon"
        }
        
        if (timeInterval < 60) {
            return "less than minute ago"
        } else if (timeInterval < 60 * 60) {
            let minutes = Int(timeInterval / 60)
            let s = ( minutes > 1 ? "s" : "" )
            return "\(minutes) minute\(s) ago"
        } else if (timeInterval < 60 * 60 * 24) {
            let hours = Int(timeInterval / 60 / 60)
            let s = ( hours > 1 ? "s" : "" )
            return "\(hours) hour\(s) ago"
        } else if (timeInterval < 60 * 60 * 24 * 31) {
            let days = Int(timeInterval / 60 / 60 / 24)
            let s = ( days > 1 ? "s" : "" )
            return "\(days) day\(s) ago"
        } else if (timeInterval < 60 * 60 * 24 * 31 * 12) {
            let months = Int(timeInterval / 60 / 60 / 24 / 31)
            let s = ( months > 1 ? "s" : "" )
            return "\(months) month\(s) ago"
        } else {
            let years = Int(timeInterval / 60 / 60 / 24 / 365)
            let s = ( years > 1 ? "s" : "" )
            return "\(years) year\(s) ago"
        }
    }
    
    /**
        Will return readable string from given date. For date less than 24 hours will return exact *hour:minute*.
        For date less than 1 week will return *day of week*. And finaly for all other dates will return 
        date in *en_US_POSIX* format
    
        :param: date is a NSDate that will be used for readable string generation
    
        :returns: Human readable date string
    */
    class func readableDate(date: NSDate) -> String {
        let timeInterval = NSDate().timeIntervalSinceDate(date)
        let dateFormatter = NSDateFormatter()
        dateFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
        
        if timeInterval < 0 {
            return "soon"
        }
        
        if NSDate().isTheSameDay(date) == true {
            dateFormatter.dateFormat = "h:mm a"
            return dateFormatter.stringFromDate(date).uppercaseString
        } else if (timeInterval < 60 * 60 * 24 * 7) {
            dateFormatter.dateFormat = "EEEE"
            return dateFormatter.stringFromDate(date)
        } else {
            dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
            dateFormatter.timeStyle = NSDateFormatterStyle.NoStyle
            dateFormatter.doesRelativeDateFormatting = true
            
            return dateFormatter.stringFromDate(date).uppercaseString
        }
    }

}
