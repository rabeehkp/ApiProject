//
//  PaddingLabel.swift
//  DemoApiProject
//
//  Created by Rabeeh KP on 07/12/17.
//  Copyright © 2017 Rabeeh KP. All rights reserved.
//

import UIKit

class PaddingLabel: UILabel {

    
    @IBInspectable var topInset: CGFloat = 10.0
    @IBInspectable var bottomInset: CGFloat = 10.0
    @IBInspectable var leftInset: CGFloat = 10.0
    @IBInspectable var rightInset: CGFloat = 10.0
    
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: UIEdgeInsetsInsetRect(rect, insets))
    }
    
    override var intrinsicContentSize: CGSize {
        
            var ContentSize = super.intrinsicContentSize
            let newSize = self.text!.boundingRect(with: CGSize(width: ContentSize.width, height: CGFloat.greatestFiniteMagnitude), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font : self.font], context: nil)
            ContentSize.height += ceil(newSize.size.height) + self.topInset + self.bottomInset

            ContentSize.width += leftInset + rightInset
            
            return ContentSize
        
    }

}
