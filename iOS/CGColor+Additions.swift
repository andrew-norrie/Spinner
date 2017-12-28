//
//  CGColor+Additions.swift
//

import QuartzCore


fileprivate func Color(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> CGColor
{
    guard let color = CGColor(colorSpace: CGColorSpaceCreateDeviceRGB(), components: [red, green, blue, alpha]) else { abort() }

    return color
}


fileprivate let White = Color(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0);
fileprivate let Red = Color(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0);
fileprivate let Black = Color(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0);


extension CGColor
{
    static var red : CGColor { get { return Red } }
    static var white : CGColor { get { return White } }
    static var black : CGColor { get { return Black } }
}
