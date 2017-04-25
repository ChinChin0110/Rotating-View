//
//  RotatingView.swift
//  Rotating-View
//
//  Created by ChinChin on 2017/4/25.
//  Copyright © 2017年 Chin. All rights reserved.
//

import UIKit

class RotationView: UIView, CAAnimationDelegate {
    
    var rotaionImage: UIImage? = UIImage(named: "Fan") {
        didSet {
            imageView.image = rotaionImage
        }
    }
    var secondPerRevolution: Double = 1.5
    var clockwise: Bool = true
    var isRotation: Bool{
        get {
            return _isRotation
        }
    }
    
    private var _isRotation: Bool = false
    private var imageView: UIImageView = UIImageView()
    
    override var frame: CGRect {
        didSet {
            updateLayerFrames()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView = UIImageView(image: rotaionImage!)
        addSubview(imageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateLayerFrames() {
        imageView.frame = bounds.insetBy(dx: 0.0, dy: 0.0)
        imageView.setNeedsDisplay()
    }
    
    func rotationBegin() {
        let rotaionAnimation = RotationAnimation(state: .begin, speed: secondPerRevolution, clockwise: clockwise)
        rotaionAnimation.delegate = self
        _isRotation = true
        imageView.layer.add(rotaionAnimation, forKey: nil)
    }
    
    func rotation() {
        let rotaionAnimation = RotationAnimation(state: .progress, speed: secondPerRevolution, clockwise: clockwise)
        imageView.layer.add(rotaionAnimation, forKey: "Rotaion")
    }
    
    func rotationStop() {
        imageView.layer.removeAnimation(forKey: "Rotaion")
        
        _isRotation = false
        let rotaionAnimation = RotationAnimation(state: .end, speed: secondPerRevolution, clockwise: clockwise)
        imageView.layer.add(rotaionAnimation, forKey: nil)
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if anim.value(forKey: "Rotaion") as! String == "Begin" {
            rotation()
        }
    }
    
}
