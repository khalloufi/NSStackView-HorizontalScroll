//
//  ViewController.swift
//  NSStackView-HorizontalScroll
//
//  Created by issam on 30/07/2018.
//  Copyright © 2018 ZetaLearning Inc. All rights reserved.
//

import Cocoa
class ViewController: NSViewController {
    @IBOutlet weak var scroll: NSScrollView!
    @IBOutlet weak var stack: NSStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
        NSEvent.addLocalMonitorForEvents(matching: .keyDown) {
            self.appendViewToStack()
            return $0
        }
    }
    
    private func appendViewToStack() {
        let view = NSView()
        stack.addArrangedSubview(view)
        view.wantsLayer = true
        view.layer?.backgroundColor = NSColor.random.cgColor
        view.addConstraint(view.widthAnchor.constraint(equalToConstant: 20))
    }
    
}

let colors: [NSColor] = [.blue, .red, .orange, .yellow, .brown, .black, .green, .purple, .gray, .cyan]

private extension NSColor {
    class var random: NSColor { return colors[Int(arc4random_uniform(UInt32(colors.count)))] }
}

class FlippedClipView: NSClipView {
    override var isFlipped: Bool { return true }
}
