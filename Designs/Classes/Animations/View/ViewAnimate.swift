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

    public func animateIn(visualView : UIVisualEffectView?, animateView : UIView?, controllerView : UIView){
        visualView?.isHidden = false
        controllerView.addSubview(animateView!)
        animateView?.center = controllerView.center
        animateView?.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        animateView?.alpha = 0
        UIView.animate(withDuration: 0.4) {
            animateView?.alpha = 1
            animateView?.transform = CGAffineTransform.identity
        }
    }
    
    public func animateOut(visualView : UIVisualEffectView?, animateView : UIView?){
        UIView.animate(withDuration: 0.3, animations: {
            animateView?.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            animateView?.alpha = 0
            visualView?.effect = nil
            visualView?.isHidden = true
        }) { (success:Bool) in
            animateView?.removeFromSuperview()
        }
    }
    
    
}
