//
//  DKStickyHeaderView.swift
//  DKStickyHeaderView
//
//  Created by Bannings on 15/5/4.
//  Copyright (c) 2015年 ZhangAo. All rights reserved.
//

import UIKit

private let KEY_PATH_CONTENTOFFSET = "contentOffset"

class DKStickyHeaderView: UIView {
    
    private var minHeight: CGFloat
    
    init(minHeight: CGFloat) {
        self.minHeight = minHeight
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: minHeight))
        
        self.clipsToBounds = true
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func willMoveToSuperview(newSuperview: UIView?) {
        super.willMoveToSuperview(newSuperview)
        
        self.superview?.removeObserver(self, forKeyPath: KEY_PATH_CONTENTOFFSET)
        if newSuperview != nil {
            assert(newSuperview!.self.isKindOfClass(UIScrollView.self), "superview must be UIScrollView!")
            
            var newFrame = self.frame
            newFrame.size.width = newSuperview!.bounds.size.width
            self.frame = newFrame
            
            self.autoresizingMask = .FlexibleWidth
            newSuperview?.addObserver(self, forKeyPath: KEY_PATH_CONTENTOFFSET, options: .New, context: nil)
        }
    }
    
    override func observeValueForKeyPath(keyPath: String, ofObject object: AnyObject, change: [NSObject : AnyObject], context: UnsafeMutablePointer<Void>) {
        if keyPath == KEY_PATH_CONTENTOFFSET {
            let scrollView = self.superview as! UIScrollView
            
            var delta: CGFloat = 0.0
            if scrollView.contentOffset.y < 0.0 {
                delta = fabs(min(0.0, scrollView.contentOffset.y))
            }
            
            var newFrame = self.frame
            newFrame.origin.y = -delta
            newFrame.size.height = self.minHeight + delta
            self.frame = newFrame
        } else {
            super.observeValueForKeyPath(keyPath, ofObject: object, change: change, context: context)
        }
    }
    
}