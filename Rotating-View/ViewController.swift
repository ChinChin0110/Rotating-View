//
//  ViewController.swift
//  Rotating-View
//
//  Created by ChinChin on 2017/4/25.
//  Copyright © 2017年 Chin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var rotationView = RotationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rotationView.frame = CGRect(x: 30, y: 30, width: 100, height: 100)
        rotationView.center = view.center
        rotationView.secondPerRevolution = 0.6
        rotationView.clockwise = false
        
        view.addSubview(rotationView)
        
        let onOffBtn = UIButton(type: .roundedRect)
        onOffBtn.setTitle("On/Off", for: .normal)
        onOffBtn.tintColor = UIColor.lightGray
        onOffBtn.frame = CGRect(x: 20, y: view.frame.height - 100, width: 100, height: 40)
        onOffBtn.layer.borderColor = UIColor.lightGray.cgColor
        onOffBtn.layer.borderWidth = 2.0
        onOffBtn.layer.cornerRadius = 10.0
        onOffBtn.layer.masksToBounds = true
        onOffBtn.addTarget(self, action: #selector(handleOnOffFan), for: .touchUpInside)
        view.addSubview(onOffBtn)
        
        let changeClockwiseBtn = UIButton(type: .roundedRect)
        changeClockwiseBtn.setTitle("Clockwise", for: .normal)
        changeClockwiseBtn.tintColor = UIColor.lightGray
        changeClockwiseBtn.frame = CGRect(x: view.frame.width - 120, y: view.frame.height - 100, width: 100, height: 40)
        changeClockwiseBtn.layer.borderColor = UIColor.lightGray.cgColor
        changeClockwiseBtn.layer.borderWidth = 2.0
        changeClockwiseBtn.layer.cornerRadius = 10.0
        changeClockwiseBtn.layer.masksToBounds = true
        changeClockwiseBtn.addTarget(self, action: #selector(handleClockwise), for: .touchUpInside)
        view.addSubview(changeClockwiseBtn)
    }
    
    func handleOnOffFan() {
        if rotationView.isRotation {
            rotationView.rotationStop()
        } else {
            rotationView.rotationBegin()
        }
    }
    
    func handleClockwise() {
        if rotationView.clockwise {
            rotationView.clockwise = false
            rotationView.rotationBegin()
        } else {
            rotationView.clockwise = true
            rotationView.rotationBegin()
            
        }
    }
    
}
