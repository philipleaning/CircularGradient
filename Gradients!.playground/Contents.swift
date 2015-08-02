//: Playground - noun: a place where people can play

import Cocoa

class GradientView: NSView {
    let blockiness = 5.0 // pick a value from 0.25 to 5.0
    
    override func drawRect(rect : CGRect) {
        NSColor.whiteColor().setFill()
        NSBezierPath.fillRect(rect)
        let startTime = NSDate().timeIntervalSince1970
        drawGradient(rect)
        let elapsedTime = NSDate().timeIntervalSince1970 - startTime
        println("Elapsed time: \(elapsedTime) seconds")
    }
    
    
    func drawGradient(rect : CGRect) {
        let width:Double = Double(rect.size.width)
        let height:Double = Double(rect.size.height)
        let startTime = NSDate().timeIntervalSince1970
    
        for x in stride(from: 0, through: width, by: blockiness) {
            for y in stride(from: 0, through: height, by: blockiness) {
                let alpha = degreesFromCartesian(x, y: y) / 90
                let color = NSColor(calibratedRed: 1.0, green: 0.0, blue: 0.0, alpha: CGFloat(alpha))
                color.setFill()
                NSBezierPath.fillRect(CGRect(x: x, y: y, width: blockiness, height: blockiness))
            }
        }
        
        let elapsedTime = NSDate().timeIntervalSince1970 - startTime
        println("Calculation time: \(elapsedTime)")
    }
    
    func degreesFromCartesian(x: Double, y: Double) -> Double {
        let degrees = atan(y / x) * 180 / M_PI
        
        return degrees
    }
}

let sideLength = 200
let rect = CGRect(x: 0, y: 0, width: sideLength, height: sideLength)

let a = GradientView(frame: rect)

