//
//  DKMenuController.swift
//  DKStickyHeaderView
//
//  Created by 张奥 on 15/5/5.
//  Copyright (c) 2015年 ZhangAo. All rights reserved.
//

import UIKit

class DKMenuController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let headerView = DKStickyHeaderView(minHeight: 0)
        headerView.backgroundColor = UIColor.blueColor()
        self.tableView.addSubview(headerView)
    }
}
