//
//  ViewAnimate.swift
//  iOSDesigns
//
//  Created by CSS on 20/07/18.
//

import Foundation
import UIKit

public class ViewAnimate {
    
    public init() {}
    
    public func animateIn(animateView : UIView, controllerView : UIView, isBackgroundBlur : Bool){
        let setView = UIView(frame: CGRect(x: 0, y: 0, width:controllerView.frame.width, height: controllerView.frame.height))
        if isBackgroundBlur {
            let blurEffect = UIBlurEffect(style: .light)
            let blurredEffectView = UIVisualEffectView(effect: blurEffect)
            blurredEffectView.frame = setView.bounds
            blurredEffectView.tag = 994
            controllerView.addSubview(blurredEffectView)
        } else {
            setView.backgroundColor = UIColor.lightGray
            setView.alpha = 0.5
            setView.tag = 994
            controllerView.addSubview(setView)
        }
        controllerView.addSubview(animateView)
        animateView.center = controllerView.center
        animateView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        animateView.alpha = 0
        UIView.animate(withDuration: 0.4) {
            animateView.alpha = 1
            animateView.transform = CGAffineTransform.identity
        }
    }
    
    public func animateOut(controllerView : UIView, animateView : UIView?){
        UIView.animate(withDuration: 0.3, animations: {
            animateView?.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            animateView?.alpha = 0
        }) { (success:Bool) in
            animateView?.removeFromSuperview()
            if let backgroundView = controllerView.viewWithTag(994){
                backgroundView.removeFromSuperview()
            }
        }
    }
    
    
}

enum Transition {
    
    case top
    case bottom
    case right
    case left
    
    var type : String {
        
        switch self {
            
        case .top :
            return kCATransitionFromBottom
        case .bottom :
            return kCATransitionFromTop
        case .right :
            return kCATransitionFromLeft
        case .left :
            return kCATransitionFromRight
            
        }
        
    }
    
}

extension UIView {
    
    
    func show(with transition : Transition, duration : CFTimeInterval = 0.5, completion : (()->())?) {
        
        let animation = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        animation.type = kCATransitionPush
        animation.subtype = transition.type
        animation.duration = duration
        
        self.layer.add(animation, forKey: kCATransitionPush)
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            completion?()
        }
    }
    
    // MARK:- Dismiss view
    
    func dismissView(with duration : TimeInterval = 0.3, onCompletion completion : (()->Void)?){
        
        UIView.animate(withDuration: duration, animations: {
            self.frame.origin.y += self.frame.height
        }) { (_) in
            self.removeFromSuperview()
            completion?()
        }
    }
    
    
    func dismissKeyBoardonTap(){
        
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.endEditingForce)))
        
    }
    
    @IBAction func endEditingForce(){
        
        self.endEditing(true)
        
    }
    
    
    // Hide and show in Dispatch Main thread
    
    func isHideInMainThread(_ isHide : Bool){
        
        DispatchQueue.main.async {
            
            if isHide {
                UIView.animate(withDuration: 0.1, animations: {
                    self.isHidden = isHide
                })
            } else {
                self.isHidden = isHide
            }
            
        }
        
    }
    
    //Setting Corner Radius
    
    @IBInspectable
    var cornerRadius : CGFloat {
        
        get{
            return self.layer.cornerRadius
        }
        
        set(newValue) {
            self.layer.cornerRadius = newValue
        }
        
    }
    
    
    //MARK:- Setting bottom Line
    
    @IBInspectable
    var borderLineWidth : CGFloat {
        get {
            return self.layer.borderWidth
        }
        set(newValue) {
            self.layer.borderWidth = newValue
        }
    }
    
    
    //MARK:- Setting border color
    
    @IBInspectable
    var borderColor : UIColor {
        
        get {
            
            return UIColor(cgColor: self.layer.borderColor ?? UIColor.clear.cgColor)
        }
        set(newValue) {
            self.layer.borderColor = newValue.cgColor
        }
        
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
    
    
    //MARK:- Shadow Opacity
    @IBInspectable
    var opacityShadow : Float {
        
        get{
            return self.layer.shadowOpacity
        }
        set(newValue) {
            self.layer.shadowOpacity = newValue
        }
        
    }
    
    //MARK:- Shadow Color
    @IBInspectable
    var colorShadow : UIColor? {
        
        get{
            return UIColor(cgColor: self.layer.shadowColor ?? UIColor.clear.cgColor)
        }
        set(newValue) {
            self.layer.shadowColor = newValue?.cgColor
        }
    }
    
    //MARK:- Shadow Radius
    @IBInspectable
    var radiusShadow : CGFloat {
        get {
            return self.layer.shadowRadius
        }
        set(newValue) {
            
            self.layer.shadowRadius = newValue
        }
    }
    
    //MARK:- Mask To Bounds
    
    @IBInspectable
    var maskToBounds : Bool {
        get {
            return self.layer.masksToBounds
        }
        set(newValue) {
            
            self.layer.masksToBounds = newValue
        }
    }
    
    
    //MARK:- Add Shadow with bezier path
    
    func addShadow(color : UIColor = .gray, opacity : Float = 0.5, offset : CGSize = CGSize(width: 0.5, height: 0.5), radius : CGFloat = 0.5, rasterize : Bool = true, maskToBounds : Bool = false){
        
        layer.masksToBounds = maskToBounds
        self.custom(layer: self.layer, opacity: opacity, offset: offset, color: color, radius: radius)
        //layer.shadowPath = UIBezierPath(rect: self.frame).cgPath
        layer.shouldRasterize = rasterize
        
    }
    
    //MARK:- Add shadow by beizer
    
    func addShadowBeizer(){
        
        
        let shadowLayer = CAShapeLayer()
        shadowLayer.path = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.bounds.width/2).cgPath
        shadowLayer.fillColor = UIColor.blue.cgColor
        shadowLayer.shadowPath = shadowLayer.path
        
        
        shadowLayer.shadowColor = UIColor.darkGray.cgColor
        shadowLayer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        shadowLayer.shadowOpacity = 0.8
        shadowLayer.shadowRadius = 4
        
        self.layer.insertSublayer(shadowLayer, at: 0)
        
    }
    
    
    private func custom(layer customLayer : CALayer, opacity : Float, offset : CGSize, color : UIColor, radius : CGFloat){
        
        customLayer.shadowColor = color.cgColor
        customLayer.shadowOpacity = opacity
        customLayer.shadowOffset = offset
        customLayer.shadowRadius = radius
        
        
    }
    
    //MARK:- Make View Round
    
    func makeRoundedCorner(){
        
        self.layer.masksToBounds = true
        self.layer.cornerRadius = self.bounds.width/2
        
    }
    
    //MARK:- Add Button Animation
    
    func addPressAnimation(with  duration : TimeInterval = 0.2 , transform : CGAffineTransform = CGAffineTransform(scaleX: 0.95, y: 0.95)) {
        
        UIView.animate(withDuration: duration, animations: {
            self.transform = transform
        }) { (bool) in
            UIView.animate(withDuration: duration, animations: {
                self.transform = .identity
            })
        }
    }
    
    // MARK:- Create Half Circle
    
    func createCircleShapeLayer(strokeColor: UIColor, fillColor: UIColor) ->CAShapeLayer{
        let layer = CAShapeLayer()
        let circularPath = UIBezierPath(arcCenter: .zero, radius: self.bounds.width/2, startAngle: .pi, endAngle: 0 , clockwise: true)
        layer.path = circularPath.cgPath
        layer.strokeColor = strokeColor.cgColor
        // layer.lineWidth = 20
        layer.fillColor = fillColor.cgColor
        layer.lineCap = kCALineCapRound
        //  layer.lineDashPhase
        layer.position = CGPoint(x: self.bounds.width/2, y: self.bounds.height)
        
        return layer
    }
    
    func showAnimateView(_ view: UIView, isShow: Bool, direction: Transition, duration : Float = 0.8 ) {
        if isShow {
            view.isHidden = false
            self.bringSubview(toFront: view)
            print(direction.type)
            pushTransition(CFTimeInterval(duration), view: view, withDirection: direction)
            
            
        }
        else {
            self.sendSubview(toBack: view)
            view.isHidden = true
            pushTransition(CFTimeInterval(duration), view: view, withDirection: direction)
        }
    }
    
    func pushTransition(_ duration: CFTimeInterval, view: UIView, withDirection direction: Transition) {
        let animation = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        animation.type = kCATransitionPush
        animation.subtype = direction.type
        animation.duration = duration
        view.layer.add(animation, forKey: kCATransitionMoveIn)
        
    }
    
}

