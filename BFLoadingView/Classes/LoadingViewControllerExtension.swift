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
    fileprivate static let loadingBackgroundViewTag = 9001
}

extension UIViewController {
    public func showLoadingView(backgroundColor: UIColor = #colorLiteral(red: 0.5217987895, green: 0.5218115449, blue: 0.52180475, alpha: 1),
                                triangle1Color: UIColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),
                                triangle2Color: UIColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5)) {
        
        guard let window = UIApplication.shared.keyWindow else {
            return
        }
        
        let backgroundLoadingView = UIView(frame: window.bounds)
        backgroundLoadingView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.25)
        backgroundLoadingView.alpha = 0
        backgroundLoadingView.tag = Constants.loadingBackgroundViewTag
        window.addSubview(backgroundLoadingView)
        
        let loadingView = LoadingView(backgroundColor: backgroundColor, triangle1Color: triangle1Color, triangle2Color: triangle2Color)
        loadingView.alpha = 0
        loadingView.tag = Constants.loadingViewTag
        window.addSubview(loadingView)
    
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        loadingView.widthAnchor.constraint(equalToConstant: LoadingView.width).isActive = true
        loadingView.heightAnchor.constraint(equalToConstant: LoadingView.height).isActive = true
        loadingView.centerXAnchor.constraint(equalTo: window.centerXAnchor).isActive = true
        loadingView.centerYAnchor.constraint(equalTo: window.centerYAnchor).isActive = true
        
        UIView.animate(withDuration: 0.25) {
            loadingView.alpha = 1
            backgroundLoadingView.alpha = 1
        }
    }
    
    public func hideLoadingView() {
        
        guard let window = UIApplication.shared.keyWindow else {
            return
        }
        
        window.subviews.forEach { subview in
            if subview.tag == Constants.loadingViewTag || subview.tag == Constants.loadingBackgroundViewTag {
                UIView.animate(withDuration: 0.25, animations: {
                    subview.alpha = 0
                }, completion: { _ in
                    subview.removeFromSuperview()
                })
            }
        }
    }
}
