//
//  ViewController.swift
//  DKStickyHeaderView
//
//  Created by Bannings on 15/5/4.
//  Copyright (c) 2015年 ZhangAo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let headerView = DKStickyHeaderView(minHeight: 150)
        headerView.autoresizingMask = .FlexibleWidth
        headerView.backgroundColor = UIColor.blueColor()
        
        let imageView = UIImageView(image: UIImage(named: "Image"))
        headerView.addSubview(imageView)
        imageView.frame = headerView.bounds
        imageView.autoresizingMask = .FlexibleWidth | .FlexibleHeight
        imageView.contentMode = UIViewContentMode.ScaleAspectFill
        
        self.view.addSubview(headerView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

