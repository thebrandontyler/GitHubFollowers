//
//  UITableView+Ext.swift
//  GHFollowers
//
//  Created by Brandon Tyler on 2/19/20.
//  Copyright © 2020 Brandon Maynard. All rights reserved.
//

import UIKit

extension UITableView {
    
    func reloadDataOnMainThread() {
        DispatchQueue.main.async { self.reloadData() }
    }
    
    func removeExcessCells() {
        tableFooterView = UIView(frame: .zero)
    }
}
