//
//  Spinner.swift
//
//

import QuartzCore


struct Arc
{
    let innerRadius : CGFloat
    let outerRadius : CGFloat

    let twist : CGFloat

    func add(to path: CGMutablePath, at pivot: CGPoint)
    {
        let origin = CGPoint(x: 0, y: 0)

        var matrix = CGAffineTransform(rotationAngle: twist)
        matrix.tx = pivot.x - origin.x
        matrix.ty = pivot.y - origin.y

        path.moveTo(x: origin.x + outerRadius, y: origin.y, transform: matrix)
        path.addArc(center: origin, radius: outerRadius, startAngle: 0, endAngle: CGFloat.pi, clockwise: false, transform: matrix)

        if(innerRadius > origin.x) {
            path.lineTo(x: origin.x - innerRadius, y: origin.y, transform: matrix)
            path.addArc(center: origin, radius: innerRadius, startAngle: CGFloat.pi, endAngle: 0, clockwise: true, transform: matrix)
        }

        path.closeSubpath()
    }
}


class Spinner
{
    let light : CGColor
    let dark : CGColor

    init(light: CGColor, dark: CGColor)
    {
        self.light = light;
        self.dark = dark;
    }

    var angle : CGFloat = 0
    var delta : CGFloat = 0

    func update(elapsedTime: TimeInterval)
    {
        func increase(_ value: CGFloat, by amount: CGFloat) -> CGFloat {
            let result = value + amount
            let cycle = 2 * CGFloat.pi

            return result < cycle ? result : result - cycle;
        }

        angle = increase(angle, by: CGFloat(elapsedTime * TimeInterval.pi / 10))
        delta = increase(delta, by: CGFloat(elapsedTime * TimeInterval.pi / 20))
    }

    func draw(in context: CGContext, center pivot: CGPoint, radius: CGFloat, angle: CGFloat, rake: CGFloat)
    {
        func disc(color: CGColor) {
            let path = CGMutablePath();

            Arc(innerRadius: 0, outerRadius: radius, twist: 0 * CGFloat.pi).add(to: path, at: pivot)
            Arc(innerRadius: 0, outerRadius: radius, twist: 1 * CGFloat.pi).add(to: path, at: pivot)

            context.addPath(path);

            context.setFillColor(color)
            context.fillPath()
        }

        func arcs(color: CGColor) {
            let count = 16

            func len(_ i: Int) -> CGFloat {
                return i < 2 ? 0 : CGFloat(i) * radius / CGFloat(count)
            }

            func rot(_ i: Int) -> CGFloat {
                return angle + CGFloat(count - 1 - i) * rake
            }

            let path = CGMutablePath();

            for i in 1..<count {
                Arc(innerRadius: len(i), outerRadius: len(i+1), twist: rot(i)).add(to: path, at: pivot)
            }

            context.addPath(path);

            context.setFillColor(color)
            context.fillPath()
        }

        disc(color: light)
        arcs(color: dark)
    }

    func draw(in context: CGContext, center pivot: CGPoint, radius: CGFloat)
    {
        draw(in: context, center: pivot, radius: radius, angle: angle, rake: delta)
    }
}
