//
//  View.swift
//

import UIKit


class View : UIView
{
    let shape = Spinner(light: CGColor.white, dark: CGColor.red);

    var midPoint : CGPoint
    {
        get { return CGPoint(x: bounds.midX, y: bounds.midY) }
    }

    override func didMoveToWindow()
    {
        layer.drawsAsynchronously = true
        clearsContextBeforeDrawing = false
        isOpaque = true
    }

    override func draw(_ rect: CGRect)
    {
        func fit(_ size: CGSize) -> CGFloat {
            return CGFloat.maximum(64, CGFloat.minimum(size.width, size.height) - 10) / 2
        }

        if let context = UIGraphicsGetCurrentContext() {
            context.setFillColor(CGColor.black)
            context.fill(bounds)
            shape.draw(in: context, center: midPoint, radius: fit(bounds.size))
        }
    }

    @objc func update(displayLink: CADisplayLink)
    {
        shape.update(elapsedTime: displayLink.targetTimestamp - displayLink.timestamp)
        self.setNeedsDisplay()
    }
}
