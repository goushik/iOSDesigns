//
//  ModifiedImageView.swift
//  iOSDesigns
//
//  Created by CSS on 20/07/18.
//

import Foundation
import UIKit

@IBDesignable
public class ModifiedImageView: UIImageView {
    
    //MARK:- Make Rounded Corner
    @IBInspectable
    var isRoundedCorner : Bool = false {
        didSet {
            if isRoundedCorner {
                self.layer.masksToBounds = true
                self.layer.cornerRadius =  frame.height/2
            }
        }
    }
    
    //MARK:- Make Image Tint Color
    @IBInspectable
    var isImageTintColor : Bool = false {
        didSet {
            if isImageTintColor {
                self.image = self.image?.withRenderingMode(.alwaysTemplate)
            }
        }
    }
}

extension UIImage {
    
    func imageWithInsets(insetDimen: CGFloat) -> UIImage {
        return imageWithInset(insets: UIEdgeInsets(top: insetDimen, left: insetDimen, bottom: insetDimen, right: insetDimen))
    }
    
    func imageWithInset(insets: UIEdgeInsets) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(
            CGSize(width: self.size.width + insets.left + insets.right,
                   height: self.size.height + insets.top + insets.bottom), false, self.scale)
        let origin = CGPoint(x: insets.left, y: insets.top)
        self.draw(at: origin)
        let imageWithInsets = UIGraphicsGetImageFromCurrentImageContext()?.withRenderingMode(self.renderingMode)
        UIGraphicsEndImageContext()
        return imageWithInsets!
    }
    
}

