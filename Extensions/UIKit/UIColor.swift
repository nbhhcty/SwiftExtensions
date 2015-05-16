//
//  UIColor.swift
//  Swift extensions
//
//  Created by Anatoliy Voropay on 5/7/15.
//  Copyright (c) 2015 Smartarium.com. All rights reserved.
//

import UIKit

public extension UIColor {
    
    /**
        This will create UIColor from a hex string. It will work correctly if hex string will contain # prefix or not.
        It will return nil if string could not be converted to UIColor (i.e. when color string is less than 6 symbols length)
        In a returned UIColor alpha component always will be 1
    
        :param: string is a hex color string. I.e. *#FFAD12* or *DDAA55*
    
        :returns: UIColor from hex string
    */
    class func colorWithHex(hex: String) -> UIColor {
        var cString:String = hex.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()).uppercaseString
        
        if cString.hasPrefix("#") {
            cString = cString.substringFromIndex(advance(cString.startIndex, 1))
        }
        
        if (count(cString) != 6) {
            return UIColor.clearColor()
        }
        
        var rString = cString.substringToIndex(advance(cString.startIndex, 2))
        var gString = cString.substringFromIndex(advance(cString.startIndex, 2)).substringToIndex(advance(cString.startIndex, 2))
        var bString = cString.substringFromIndex(advance(cString.startIndex, 4)).substringToIndex(advance(cString.startIndex, 2))
        
        var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
        NSScanner(string: rString).scanHexInt(&r)
        NSScanner(string: gString).scanHexInt(&g)
        NSScanner(string: bString).scanHexInt(&b)
        
        var rF = (CGFloat) (Float(r) / 255.0)
        var gF = (CGFloat) (Float(g) / 255.0)
        var bF = (CGFloat) (Float(b) / 255.0)
        
        return UIColor(red: rF, green: gF, blue: bF, alpha: 1.0)
    }
}