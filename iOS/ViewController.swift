//
//  ViewController.swift
//

import UIKit

class ViewController: UIViewController
{
    var displayLink : CADisplayLink?

    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated);

        let view = self.view as! View

        self.displayLink = CADisplayLink(target: view, selector: #selector(view.update))
    //  displayLink?.preferredFramesPerSecond = 30;
    //  displayLink?.isPaused = true;
        displayLink?.add(to: .current, forMode: .defaultRunLoopMode)
    }

    override func viewWillDisappear(_ animated: Bool)
    {
        displayLink?.remove(from: .current, forMode: .defaultRunLoopMode)
        self.displayLink = nil;

        super.viewWillDisappear(animated);
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
}
