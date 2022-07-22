//
//  ViewController.swift
//  StickyFooterScrollViewExample
//
//  Created by Nguyen, Thinh on 22/07/2022.
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

extension ViewController {
    
}
