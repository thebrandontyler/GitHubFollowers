//
//  UIView+Ext.swift
//  GHFollowers
//
//  Created by Brandon Tyler on 2/19/20.
//  Copyright © 2020 Brandon Maynard. All rights reserved.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        for view in views { addSubview(view) }
    }
}
