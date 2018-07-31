




import UIKit

@IBDesignable
public class Label : UILabel {
    
    //MARK:- UnderLined
    @IBInspectable var isUnderLined : Bool = false {
        
        didSet {
            updateAttributedText()
        }
    }
    
    /*
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
    
    private func updateAttributedText(){
        
        let mutableString = NSMutableAttributedString(string: String.removeNil(self.text), attributes: [NSAttributedStringKey.font: self.font ?? (UIFont(name: "Lato-Regular", size: 14.0))!])
        
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
        self.attributedText = mutableString
    }
 */
    
}
