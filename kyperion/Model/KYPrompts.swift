//
//  KYPrompts.swift
//  kyperion
//
//  Copyright © 2015 Kyperion SL. All rights reserved.
//

import UIKit

public class KYPrompts : NSObject {
    
    //// Drawing Methods
    /*
    public class func drawKYPrompt(frame frame: CGRect, backgroundColor: UIColor, headerBarColor: UIColor, bottomBarColor: UIColor, headerTxtColor: UIColor, contentTxtColor: UIColor, outlineColor: UIColor, topLineColor: UIColor, bottomLineColor: UIColor, dismissIconButton: UIColor, promptText: String, textSize: CGFloat, topBarVisibility: Bool, bottomBarVisibility: Bool, headerText: String, headerSize: CGFloat, topLineVisibility: Bool, bottomLineVisibility: Bool, outlineVisibility: Bool, dismissIconVisibility: Bool) {
    */
    public class func drawKYPrompt(#frame: CGRect, backgroundColor: UIColor, headerBarColor: UIColor, bottomBarColor: UIColor, headerTxtColor: UIColor, contentTxtColor: UIColor, outlineColor: UIColor, topLineColor: UIColor, bottomLineColor: UIColor, dismissIconButton: UIColor, promptText: String, textSize: CGFloat, topBarVisibility: Bool, bottomBarVisibility: Bool, headerText: String, headerSize: CGFloat, topLineVisibility: Bool, bottomLineVisibility: Bool, outlineVisibility: Bool, dismissIconVisibility: Bool) {
            
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()
        
        //// Rectangle Drawing
        let rectanglePath = UIBezierPath(roundedRect: CGRectMake(frame.minX + floor(frame.width * 0.01778 + 0.5), frame.minY + 9, floor(frame.width * 0.98667 + 0.5) - floor(frame.width * 0.01778 + 0.5), frame.height - 19), cornerRadius: 12)
        backgroundColor.setFill()
        rectanglePath.fill()
        
        
        if (outlineVisibility) {
            //// Rectangle 6 Drawing
            let rectangle6Path = UIBezierPath(roundedRect: CGRectMake(frame.minX + floor(frame.width * 0.01778 + 0.5), frame.minY + 9, floor(frame.width * 0.98667 + 0.5) - floor(frame.width * 0.01778 + 0.5), frame.height - 19), cornerRadius: 12)
            outlineColor.setStroke()
            rectangle6Path.lineWidth = 3.5
            rectangle6Path.stroke()
        }
        
        
        if (bottomBarVisibility) {
            //// Rectangle 2 Drawing
            //let rectangle2Path = UIBezierPath(roundedRect: CGRectMake(frame.minX + floor(frame.width * 0.01778 + 0.5), frame.minY + frame.height - 51, floor(frame.width * 0.98667 + 0.5) - floor(frame.width * 0.01778 + 0.5), 41), byRoundingCorners: [UIRectCorner.BottomLeft, UIRectCorner.BottomRight], cornerRadii: CGSizeMake(12, 12))
            var rectangle2Path = UIBezierPath(roundedRect: CGRectMake(frame.minX + floor(frame.width * 0.01778 + 0.5), frame.minY + frame.height - 51, floor(frame.width * 0.98667 + 0.5) - floor(frame.width * 0.01778 + 0.5), 41), byRoundingCorners: UIRectCorner.BottomLeft | UIRectCorner.BottomRight, cornerRadii: CGSizeMake(12, 12))
            
            rectangle2Path.closePath()
            bottomBarColor.setFill()
            rectangle2Path.fill()
        }
        
        
        //// Text Drawing
        let textRect = CGRectMake(frame.minX + 13, frame.minY + 56, frame.width - 26, frame.height - 109)
        let textStyle = NSMutableParagraphStyle.defaultParagraphStyle().mutableCopy() as! NSMutableParagraphStyle
        textStyle.alignment = NSTextAlignment.Center
        
        let textFontAttributes = [NSFontAttributeName: UIFont(name: FONT_TEXT, size: textSize)!, NSForegroundColorAttributeName: contentTxtColor, NSParagraphStyleAttributeName: textStyle]
        
        let textTextHeight: CGFloat = NSString(string: promptText).boundingRectWithSize(CGSizeMake(textRect.width, CGFloat.infinity), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: textFontAttributes, context: nil).size.height
        CGContextSaveGState(context)
        CGContextClipToRect(context, textRect);
        NSString(string: promptText).drawInRect(CGRectMake(textRect.minX, textRect.minY + (textRect.height - textTextHeight) / 2, textRect.width, textTextHeight), withAttributes: textFontAttributes)
        CGContextRestoreGState(context)
        
        
        if (topBarVisibility) {
            //// Rectangle 3 Drawing
            var rectangle3Path = UIBezierPath(roundedRect: CGRectMake(frame.minX + floor(frame.width * 0.01778 + 0.5), frame.minY + 9, floor(frame.width * 0.98667 + 0.5) - floor(frame.width * 0.01778 + 0.5), 44), byRoundingCorners: UIRectCorner.TopLeft | UIRectCorner.TopRight, cornerRadii: CGSizeMake(12, 12))
            
            //let rectangle3Path = UIBezierPath(roundedRect: CGRectMake(frame.minX + floor(frame.width * 0.01778 + 0.5), frame.minY + 9, floor(frame.width * 0.98667 + 0.5) - floor(frame.width * 0.01778 + 0.5), 44), byRoundingCorners: [UIRectCorner.TopLeft, UIRectCorner.TopRight], cornerRadii: CGSizeMake(12, 12))
            rectangle3Path.closePath()
            headerBarColor.setFill()
            rectangle3Path.fill()
        }
        
        
        //// Text 2 Drawing
        let text2Rect = CGRectMake(frame.minX + floor(frame.width * 0.05333 + 0.5), frame.minY + 17, floor(frame.width * 0.93778 + 0.5) - floor(frame.width * 0.05333 + 0.5), 34)
        let text2Style = NSMutableParagraphStyle.defaultParagraphStyle().mutableCopy() as! NSMutableParagraphStyle
        text2Style.alignment = NSTextAlignment.Center
        
        let text2FontAttributes = [NSFontAttributeName: UIFont(name: FONT_TEXT, size: headerSize)!, NSForegroundColorAttributeName: headerTxtColor, NSParagraphStyleAttributeName: text2Style]
        
        let text2TextHeight: CGFloat = NSString(string: headerText).boundingRectWithSize(CGSizeMake(text2Rect.width, CGFloat.infinity), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: text2FontAttributes, context: nil).size.height
        CGContextSaveGState(context)
        CGContextClipToRect(context, text2Rect);
        NSString(string: headerText).drawInRect(CGRectMake(text2Rect.minX, text2Rect.minY + (text2Rect.height - text2TextHeight) / 2, text2Rect.width, text2TextHeight), withAttributes: text2FontAttributes)
        CGContextRestoreGState(context)
        
        
        if (topLineVisibility) {
            //// Rectangle 4 Drawing
            let rectangle4Path = UIBezierPath(rect: CGRectMake(frame.minX + 12, frame.minY + 53, frame.width - 23, 1))
            topLineColor.setFill()
            rectangle4Path.fill()
        }
        
        
        if (bottomLineVisibility) {
            //// Rectangle 5 Drawing
            let rectangle5Path = UIBezierPath(rect: CGRectMake(frame.minX + 12, frame.minY + frame.height - 52, frame.width - 23, 1))
            bottomLineColor.setFill()
            rectangle5Path.fill()
        }
        
        
        //// Page-
        //// First
        //// Group 4
        if (dismissIconVisibility) {
            //// Shape 2 Drawing
            let shape2Path = UIBezierPath()
            shape2Path.moveToPoint(CGPointMake(frame.minX + 29.83, frame.minY + 27.57))
            shape2Path.addLineToPoint(CGPointMake(frame.minX + 28.13, frame.minY + 25.88))
            shape2Path.addLineToPoint(CGPointMake(frame.minX + 21.33, frame.minY + 32.68))
            shape2Path.addLineToPoint(CGPointMake(frame.minX + 14.53, frame.minY + 25.88))
            shape2Path.addLineToPoint(CGPointMake(frame.minX + 12.83, frame.minY + 27.57))
            shape2Path.addLineToPoint(CGPointMake(frame.minX + 19.63, frame.minY + 34.38))
            shape2Path.addLineToPoint(CGPointMake(frame.minX + 12.83, frame.minY + 41.18))
            shape2Path.addLineToPoint(CGPointMake(frame.minX + 14.53, frame.minY + 42.88))
            shape2Path.addLineToPoint(CGPointMake(frame.minX + 21.33, frame.minY + 36.07))
            shape2Path.addLineToPoint(CGPointMake(frame.minX + 28.13, frame.minY + 42.88))
            shape2Path.addLineToPoint(CGPointMake(frame.minX + 29.83, frame.minY + 41.18))
            shape2Path.addLineToPoint(CGPointMake(frame.minX + 23.03, frame.minY + 34.38))
            shape2Path.addLineToPoint(CGPointMake(frame.minX + 29.83, frame.minY + 27.57))
            shape2Path.closePath()
            shape2Path.miterLimit = 4;
            
            shape2Path.usesEvenOddFillRule = true;
            
            dismissIconButton.setFill()
            shape2Path.fill()
        }
    }
    
}





@objc protocol StyleKitSettableImage {
    func setImage(image: UIImage!)
}

@objc protocol StyleKitSettableSelectedImage {
    func setSelectedImage(image: UIImage!)
}
