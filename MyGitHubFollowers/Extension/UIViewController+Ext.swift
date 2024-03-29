//
//  UIViewController+Ext.swift
//  MyGitHubFollowers
//
//  Created by yucian huang on 2024/2/27.
//

import UIKit

extension UIViewController {
    func presentGFAlertOnMainThread(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertVC = GFAlertVC(alertTitle: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle      = .overFullScreen
            alertVC.modalTransitionStyle        = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
    
}
