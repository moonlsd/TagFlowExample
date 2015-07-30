//
//  FlowLayout.swift
//  TagFlowLayout
//
//  Created by Diep Nguyen Hoang on 7/30/15.
//  Copyright (c) 2015 CodenTrick. All rights reserved.
//

import UIKit

class FlowLayout: UICollectionViewFlowLayout {
    
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [AnyObject]? {
        var attributesForElementsInRect = super.layoutAttributesForElementsInRect(rect)
        var newAttributesForElementsInRect = [AnyObject]()
        
        var leftMargin: CGFloat = 0.0;
        
        for attributes in attributesForElementsInRect! {
            var refAttributes = attributes as! UICollectionViewLayoutAttributes
            if (refAttributes.frame.origin.x == self.sectionInset.left) {
                leftMargin = self.sectionInset.left
            } else {
                var newLeftAlignedFrame = refAttributes.frame
                newLeftAlignedFrame.origin.x = leftMargin
                refAttributes.frame = newLeftAlignedFrame
            }
            leftMargin += refAttributes.frame.size.width + 8
            newAttributesForElementsInRect.append(refAttributes)
        }
        
        return newAttributesForElementsInRect
    }
}