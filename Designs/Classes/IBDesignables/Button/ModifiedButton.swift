//
//  ModifiedButton.swift
//  iOSDesigns
//
//  Created by CSS on 20/07/18.
//

import Foundation
import UIKit

@IBDesignable
public class ModifiedButton : UIButton {
    
    //MARK:- Setting Corner Radius to Round
    @IBInspectable var isRoundedCorner : Bool = false {
        didSet {
            self.layer.masksToBounds = isRoundedCorner
            if isRoundedCorner{
                self.layer.cornerRadius = self.frame.height/2
            }
        }
    }
    
    /*
    //MARK:- UnderLined
    @IBInspectable var isUnderLined : Bool = false {
        
        didSet {
            updateAttributedText()
            
        }
    }
    
    //MARK:- Attributed String
    
    @IBInspectable var startLocation : Int = 0 {
        didSet{
            updateAttributedText()
        }
    }
    
    @IBInspectable var length : Int = 0 {
        didSet {
            updateAttributedText()
        }
    }
    
    @IBInspectable var attributeColor : UIColor = .black {
        didSet{
            updateAttributedText()
        }
    }
    
    
    public func updateAttributedText(){
        let mutableString = NSMutableAttributedString(string: String.removeNil(self.title(for: .normal)), attributes: [NSAttributedStringKey.font: self.titleLabel?.font ?? (UIFont(name: "Lato-Regular", size: 14.0))!])
        
        var attributes = [NSAttributedStringKey : Any]()
        
        if isUnderLined{
            attributes.updateValue(NSUnderlineStyle.styleSingle.rawValue, forKey: .underlineStyle)
        }
        attributes.updateValue(attributeColor, forKey: .foregroundColor)
        //   attributes.updateValue(UIFont(name: "Lato-Heavy", size: 20.0)!, forKey : NSAttributedStringKey.font)
        
        //        let underlineAttribute = (NSAttributedStringKey.underlineStyle: NSUnderlineStyle.styleSingle.rawValue)
        //        let colorAttribute = (NSAttributedStringKey.foregroundColor: attributeColor)
        // mutableString.addAttribute(NSAttributedStringKey.foregroundColor, value: attributeColor, range: NSRange(location:startLocation,length:length))
        mutableString.addAttributes(attributes, range: NSRange(location:startLocation,length:length))
        self.titleLabel?.attributedText = mutableString
    }
    */
}



extension String {
    
    static var Empty : String {
        return ""
    }
    
    static func removeNil(_ value : String?) -> String{
        return value ?? String.Empty
    }
    
    var isNumber: Bool {
        return !isEmpty && rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
    }
    
    func removingWhitespaces() -> String {
        return components(separatedBy: .whitespaces).joined()
    }
    
}
