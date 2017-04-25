## Synopsis

A simple and easy use rotatable view.

## Code Example

```Swift
var rotationView = RotationView()
    
override func viewDidLoad() {
   super.viewDidLoad()
        
   rotationView.frame = CGRect(x: 30, y: 30, width: 100, height: 100)
   rotationView.center = view.center
   rotationView.secondPerRevolution = 0.6
   rotationView.clockwise = true
        
   view.addSubview(rotationView)
        
}
```

## Motivation

I need a rotatable view ,which can rotate colockwise/counterclockwise, and also set the speed.
I creat it and share to anyone who needs it.

## Installation

Just downlond the project and copy <b>RotatingView.swift</b> & <b>RotatingAnimation.swift</b> to your project.

## API Reference

property | description
---- | ---
secondPerRevolution | how fast the view will rotate.
isRotating |  get the rotating status.
rotationImage |  the image you want to rotate.

method | description
-|-
rotationBegin()| make the view begin to rotate.
rotationStop()| make the view stop roate.

## License

MIT
