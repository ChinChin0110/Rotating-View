//
//  RotatingAnimation.swift
//  Rotating-View
//
//  Created by ChinChin on 2017/4/25.
//  Copyright © 2017年 Chin. All rights reserved.
//

import UIKit

enum RotationState {
    case begin
    case progress
    case end
}

class RotationAnimation: CABasicAnimation {
    
    private override init() {
        super.init()
        
        self.keyPath = "transform.rotation.z"
        self.isCumulative = true
    }
    
    convenience init(state: RotationState, speed: Double, clockwise: Bool) {
        self.init()
        
        toValue = clockwise ? NSNumber(value: (Double.pi * 2)) : NSNumber(value: (-Double.pi * 2))
        
        switch state {
        case .begin:
            timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
            duration = speed * 2
            setValue("Begin", forKey: "Rotaion")
        case .progress:
            duration = speed
            repeatCount = Float.infinity
            setValue("Progress", forKey: "Rotaion")
        case .end:
            timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
            duration = speed * 2
            setValue("End", forKey: "Rotaion")
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
