//
//  LoadingViewControllerExtension.swift
//  ActivityIndicator
//
//  Created by Matthias Nagel on 29.11.19.
//  Copyright © 2019 Matthias Nagel. All rights reserved.
//

import UIKit

fileprivate struct Constants {
    fileprivate static let loadingViewTag = 9000
}

extension UIViewController {
    
    public func showLoadingView() {
        let loadingView = LoadingView()
        loadingView.alpha = 0
        view.addSubview(loadingView)
        
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        loadingView.widthAnchor.constraint(equalToConstant: LoadingView.width).isActive = true
        loadingView.heightAnchor.constraint(equalToConstant: LoadingView.height).isActive = true
        loadingView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loadingView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        loadingView.tag = Constants.loadingViewTag
        
        UIView.animate(withDuration: 0.25) {
            loadingView.alpha = 1
        }
    }
    
    public func hideLoadingView() {
        for subview in view.subviews where subview.tag == Constants.loadingViewTag {
            
            UIView.animate(withDuration: 0.25, animations: {
                subview.alpha = 0
            }, completion: { _ in
                subview.removeFromSuperview()
            })
        }
    }
}
