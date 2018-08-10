//
//  Animate.swift
//  iOSDesigns
//
//  Created by CSS on 10/08/18.
//

import Foundation
import UIKit

public class Animate {
    
    public init() {}
    
    public func setParallex(to object : AnyObject?) {
        let min = CGFloat(-20)
        let max = CGFloat(20)
        
        let ymin = CGFloat(-10)
        let ymax = CGFloat(10)
        
        let xMotion = UIInterpolatingMotionEffect(keyPath: "layer.transform.translation.x", type: .tiltAlongHorizontalAxis)
        xMotion.minimumRelativeValue = min
        xMotion.maximumRelativeValue = max
        
        let yMotion = UIInterpolatingMotionEffect(keyPath: "layer.transform.translation.y", type: .tiltAlongVerticalAxis)
        yMotion.minimumRelativeValue = ymin
        yMotion.maximumRelativeValue = ymax
        
        let motionEffectGroup = UIMotionEffectGroup()
        motionEffectGroup.motionEffects = [xMotion,yMotion]
        object?.addMotionEffect(motionEffectGroup)
    }
    
}
