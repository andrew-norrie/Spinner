//
//  View.swift
//

import Cocoa


class View : NSView
{
    let shape = Spinner(light: CGColor.white, dark: CGColor.red)

    var midPoint : CGPoint
    {
        get { return CGPoint(x: bounds.midX, y: bounds.midY) }
    }

    override var isOpaque: Bool
    {
        get { return true }
    }

    override func draw(_ dirtyRect: NSRect)
    {
        func fit(_ size: CGSize) -> CGFloat {
            return CGFloat.maximum(64, CGFloat.minimum(size.width, size.height) - 10) / 2
        }

        if let context = NSGraphicsContext.current?.cgContext {
            context.setFillColor(CGColor.black)
            context.fill(bounds)
            shape.draw(in: context, center: midPoint, radius: fit(bounds.size))
        }
    }

    func update(elapsedTime t: TimeInterval)
    {
        shape.update(elapsedTime: t)
        self.needsDisplay = true
    }
}
