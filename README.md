# DKStickyHeaderView
The SticklyHeaderView can sticks to the top and stretches when you pull down.  
![GIF](https://raw.githubusercontent.com/zhangao0086/DKStickyHeaderView/master/Preview1.gif)

# How to use

```swift
let headerView = DKStickyHeaderView(minHeight: 0)
headerView.backgroundColor = UIColor.blueColor()
self.tableView.addSubview(headerView)
```

# Based on Key-Value Observing

```swift
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
```

# Licence
This code is distributed under the terms and conditions of the <a href="https://github.com/zhangao0086/DKStickyHeaderView/master/LICENSE">MIT license</a>.