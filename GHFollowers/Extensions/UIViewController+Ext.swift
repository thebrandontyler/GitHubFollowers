//
//  UIViewController+Ext.swift
//  GHFollowers
//
//  Created by Brandon Tyler on 1/29/20.
//  Copyright © 2020 Brandon Maynard. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func presentGFAlertOnMainThread(title: String, message: String, buttonTitle: String, dismissAction: (() -> Void)? = nil) {
        DispatchQueue.main.async {
            let alertVC = GFAlertVC(title: title, message: message, buttonTitle: buttonTitle, dismissAction: dismissAction)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
}
