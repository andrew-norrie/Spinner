//
//  ViewController.swift
//

import Cocoa


class ViewController : NSViewController
{
    let framesPerSecond : TimeInterval = 60
    var animationTimer : Timer?

    override func viewDidAppear()
    {
        super.viewDidAppear()

        animationTimer = Timer(timeInterval: 1 / framesPerSecond, target: self, selector: #selector(tick), userInfo: nil, repeats: true)

        if let timer = animationTimer {
            RunLoop.current.add(timer, forMode: .defaultRunLoopMode)
        }
    }

    override func viewWillDisappear()
    {
        animationTimer?.invalidate()
        animationTimer = nil

        super.viewWillDisappear()
    }

    @objc func tick(timer: Timer)
    {
        if let view = self.view as? View {
            view.update(elapsedTime: timer.timeInterval);
        }
    }
}
