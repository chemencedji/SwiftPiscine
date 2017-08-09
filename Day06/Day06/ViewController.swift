//
//  ViewController.swift
//  Day06
//
//  Created by Igor Chemencedji on 4/28/17.
//  Copyright © 2017 Igor Chemencedji. All rights reserved.
//

import UIKit
import CoreMotion

class squareShape: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(rect: rect)
        UIColor.blue.setFill()
       // path.stroke()
        path.fill()
    }
}

class circleShape:UIView {
    
    var myview: ViewController!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    override var collisionBoundsType: UIDynamicItemCollisionBoundsType{
        return .ellipse
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(ovalIn: rect)
        UIColor.green.setFill()
        path.fill()
    }
}


class ViewController: UIViewController, UIGestureRecognizerDelegate {
    
    var figView: UIView!
    
    var gravity = UIGravityBehavior()
    var animator: UIDynamicAnimator!
    var collision = UICollisionBehavior()
    var itemBehaviour: UIDynamicItemBehavior!
    
    var circleCenter: CGPoint!

    @IBAction func pressTap(_ sender: UITapGestureRecognizer) {
        let touchLocation: CGPoint = sender.location(in: sender.view)
        let index = Int(arc4random_uniform(UInt32(10)))
        if (index % 2 == 0) {
            figView = squareShape(frame: CGRect(
            origin: CGPoint(x: touchLocation.x - 50, y: touchLocation.y - 50),
            size: CGSize(width: 100, height: 100)))
            view.addSubview(figView!)
        }
        else {
            figView = circleShape(frame: CGRect(
            origin: CGPoint(x: touchLocation.x - 50, y: touchLocation.y - 50),
            size: CGSize(width: 100, height: 100)))
            figView?.backgroundColor = UIColor(white: 1, alpha: 0.1)
            view.addSubview(figView!)
        }
        figView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(self.dragCircle)))
    }
    
    func dragCircle(gesture: UIPanGestureRecognizer) {
        let target = gesture.view!
        switch gesture.state {
        case .began, .ended:
            circleCenter = target.center
        case .changed:
            let translation = gesture.translation(in: self.view)
            target.center = CGPoint(x: circleCenter!.x + translation.x, y: circleCenter!.y + translation.y)
            gesture.setTranslation(CGPoint.zero, in: self.view)
        default: break
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        animator = UIDynamicAnimator(referenceView: self.view)
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)
        animator.addBehavior(gravity)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

