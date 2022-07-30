//
//  ViewController.swift
//  StickyFooterScrollView
//
//  Created by thinhnguyen12389 on 07/30/2022.
//  Copyright (c) 2022 thinhnguyen12389. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private lazy var contentView = ContentView()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        contentView.scrollView.updateLayout()
    }
}
