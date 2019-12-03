//
//  ViewController.swift
//  BFLoadingView
//
//  Created by Matthias Nagel on 29.11.19.
//  Copyright © 2019 Matthias Nagel. All rights reserved.
//

import UIKit
import BFLoadingView

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.black
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute: {
            self.showLoadingView()
        })
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 10.0, execute: {
            self.hideLoadingView()
        })
    }
}

