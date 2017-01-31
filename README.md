# Swift extensions

![CocoaPods](https://img.shields.io/cocoapods/v/SwiftExtensions.svg)

Useful swift extensions for different classes. Main reason of this repo is that I require it in most of my projects and I decided to share with other developers.

**Info:** Extentions collection is updating. Please send me messages if you want to add some useful functionality to this repository.

## Installation

Right now the only way to install this repo is to copy it to your project.

## Foundation framework

#### NSDate

**func isTheSameDay(date: NSDate) -> Bool**

Used to check if given date is the same date as NSDate.
  
      
    var dateBefore = NSDate(timeIntervalSinceNow: -3600 * 24 - 10)
    var dateAfter = NSDate(timeIntervalSinceNow: 3600 * 24 + 10)
  
    NSDate().isTheSameDay(NSDate()) // is true
    dateBefore.isTheSameDay(NSDate()) // is false
    dateAfter.isTheSameDay(NSDate()) // is false
    
  
**class func hourlyTimingString(timeInterval: NSTimeInterval?) -> String** 

Used to generate time readable string intervals. I.e. 23:12:24 for time intervals more than 1 hour or 23:12 for intervals less than one hour.

    
    NSDate.hourlyTimingString(12) // will return '00:12'
    NSDate.hourlyTimingString(3600 - 1) // will return '59:59'
    NSDate.hourlyTimingString(3600 + 1) // will return '1:00:01'
    NSDate.hourlyTimingString(3600 * 67 + 1) // will return '67:00:01'
    

**class func readableTimeInterval(date: NSDate) -> String**

Used to generate readable time interval string. I.e. '3 minutes ago' or '2 days ago'.

    
    NSDate.hourlyTimingString(NSDate(timeIntervalSinceNow:3600 - 1)) // 59 minutes ago
    NSDate.readableTimeInterval(NSDate(timeIntervalSinceNow:-3600 - 10)) //  1 hour ago
    NSDate.readableTimeInterval(NSDate(timeIntervalSinceNow:-3600 * 24 * 5 - 10)) // 5 days ago
    NSDate.readableTimeInterval(NSDate(timeIntervalSinceNow:-3600 * 24 * 31 * 5 - 10)) // 5 months ago
    

**class func readableDate(date: NSDate) -> String**

Used to get human readable dates for past days. For date less than 24 hours will return exact *hour:minute*. 
For date less than 1 week will return *day of week*. And finaly for all other dates will return 
date in *en_US_POSIX* format

#### NSObject

**func delay(delay: Double, closure:()->())**
Will execure a closure after delay. Closure will be invoked in main thread

    
    NSDate.delay(5, closure: {
        println("After 5 seconds")
    })
    

#### NSString

**class func isEmailValid(email: String) -> Bool**

Returns *true* if email is valid. This validation is checking string for matching regexp only. 
It will not check domain extensions. It's not guarantee you that it's a real email address also.

    
    NSString.isEmailValid("not valid@gmail.com") // false
    NSString.isEmailValid("notvalid@gmail.c") // false
    NSString.isEmailValid("notvalid@gmail.") // false
    
    NSString.isEmailValid("valid@gmail.co") // true
    NSString.isEmailValid("valid_123@gmail.com") // true
    
#### NSFileManager

**func fileSizeAtPath(path: String) -> Int**

Will return size of a file in given path. If file does not exists will return 0.

## UIKit framework

#### UIColor

**class func colorWithHex(hex: String) -> UIColor**

This will create UIColor from a hex string. It will work correctly if hex string will contain # prefix or not.
It will return UIColor.clearColor() if string could not be converted to UIColor (i.e. when color string is less than 6 symbols length) In a returned UIColor alpha component always will be 1

    
    UIColor.colorWithHex("#FFAA66")
    

#### UIView

	var width: CGFloat // Returns frames width
    var height: CGFloat // Returns frames height
    var x: CGFloat // Returns frames origin x
    var y: CGFloat // Returns frames origin y
    var centerX: CGFloat // Returns frames center x
    var centerY: CGFloat // Returns frames center y
    func setWidth(width: CGFloat) // Update frames width
    func setHeight(height: CGFloat) // Returns frames height
    func setX(x: CGFloat) // Updates frames origin x position
    func setY(y: CGFloat) // Updates frames origin y position
    func setCenterX(x: CGFloat) // Updates frames center x position
    func setCenterY(y: CGFloat)  // Updates frames center y position

## Swift

#### Array

**mutating func removeObject<U: Equatable>(object: U)**

Will remove object from an array. If there are more than one the same object in array it will remove it also.

**func contains<T where T : Equatable>(object: T) -> Bool**

Will return *true* if array contains object. Object should conform *Equatable* protocol.

#### String

	func length() -> Int // Returns length of a string
	func trim() -> String // Returns trimmed string
	func substring(location: Int, length: Int) -> String! // Returns substring  with `length` of a string from `location`
	func location(substring: String) -> Int // Returns substring location or NSNotFound
	func contains(substring: String) -> Bool // Returns `true` if string contains substring
	func isNumeric() -> Bool // Returns `true` if string is numeric
	
**subscript(index: Int) -> String!**

Returns character at index. I.e:

	"abc"[1] == "b"
	"abs"[-1] == "s"

#### Int


	var isEven: Bool // Returns true if number is even
	var isOdd: Bool // Returns true if number is odd
	var isPositive: Bool // Returns true if number is positive
	var isNegative: Bool // Returns true if number is negative
	var isZero: Bool // Returns true if number is zero
	var isPOZ: Bool // Returns true if number is positive or zero
	func double() -> Double // Casts to double
	func float() -> Float // Casts to float

**func times(closure: () -> ())**

This method will repeat *closure* n times. Possible way of usage:

    
    12.times { 
        println("Hello worlds") 
    }
    
![IMG](https://bytebucket.org/anatoliy_v/test/raw/6ec2f594d29c55ca33586be0d9c73db6fbfadfc5/test.svg?token=6a9fc94c2a9d32af39c38f85cb1172ae639b5ecc)
    
