//
//  IBDesignables.swift
//  iOSDesigns
//
//  Created by CSS on 25/05/18.
//

import Foundation
import UIKit

@IBDesignable
public class ModifiedView : UIView {
    
    @IBInspectable
    var isRoundedCorner : Bool = false {
        didSet {
            if isRoundedCorner {
                self.layer.masksToBounds = true
                self.layer.cornerRadius = self.frame.height/2
            }
        }
    }
    
    //MARK:- Blur Effect
    @IBInspectable
    var isBlurred : Bool = false {
        
        didSet {
            
            if isBlurred {
                
                let visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
                visualEffectView.frame = CGRect(origin: CGPoint.zero, size: frame.size)
                self.addSubview(visualEffectView)
                
            }
            
        }
    }
    
    //MARK:- Bottom Line
    @IBInspectable
    var bottomlineHeight : CGFloat = 0{
        didSet{
            addSubLayer()
        }
    }
    
    
    //MARK:- Bottom line color
    
    @IBInspectable
    var bottomLineColor : UIColor = .white {
        didSet{
            addSubLayer()
        }
    }
    
    //MARK:- Is Bottom Line Inverted
    
    @IBInspectable
    var isBottomLineInverted : Bool = false {
        didSet{
            addSubLayer()
        }
    }
    
    // Add Corner Radius Partially
    var corner = UIRectCorner()
    
    @IBInspectable
    var isTopRightClipped : Bool = false {
        didSet{
            add(rectCorner: .topRight, isAdd: isTopRightClipped)
        }
    }
    @IBInspectable
    var isBottomRightClipped : Bool = false {
        didSet{
            add(rectCorner: .bottomRight, isAdd: isBottomRightClipped)
        }
    }
    @IBInspectable
    var isTopLeftClipped : Bool = false {
        didSet{
            add(rectCorner: .topLeft, isAdd: isTopLeftClipped)
        }
    }
    @IBInspectable
    var isBottomLeftClipped : Bool = false {
        didSet{
            add(rectCorner: .bottomLeft, isAdd: isBottomLeftClipped)
        }
    }
    
    // Add Corners
    private func add(rectCorner : UIRectCorner, isAdd : Bool){
        
        if isAdd {
            corner.insert(rectCorner)
        } else {
            corner.remove(rectCorner)
        }
        
        let path = UIBezierPath(roundedRect:self.bounds,
                                byRoundingCorners: corner,
                                cornerRadii: offsetShadow)
        
        let maskLayer = CAShapeLayer()
        
        maskLayer.path = path.cgPath
        self.layer.mask = maskLayer
        
    }

    // Adding Bottom Line
    private func addSubLayer(){
        let layer = CALayer()
        layer.frame = CGRect(origin: CGPoint(x: 0, y: isBottomLineInverted ?(self.bounds.height-bottomlineHeight) : 0), size: CGSize(width: self.bounds.width, height: bottomlineHeight))
        layer.backgroundColor = bottomLineColor.cgColor
        self.layer.addSublayer(layer)
        layer.contentsGravity = kCAGravityResizeAspectFill
    }
    
    //MARK:- Shadow Offset
    
    @IBInspectable
    var offsetShadow : CGSize {
        get {
            return self.layer.shadowOffset
        }
        set(newValue) {
            self.layer.shadowOffset = newValue
        }        
    }
}
