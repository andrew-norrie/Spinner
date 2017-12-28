//
//  CGPath+Convenience.swift
//


import QuartzCore


extension CGMutablePath
{
    func moveTo(x: CGFloat, y: CGFloat, transform matrix: CGAffineTransform)
    {
        self.move(to: CGPoint(x: x, y: y), transform: matrix)
    }

    func lineTo(x: CGFloat, y: CGFloat, transform matrix: CGAffineTransform)
    {
        self.addLine(to: CGPoint(x: x, y: y), transform: matrix)
    }
}
