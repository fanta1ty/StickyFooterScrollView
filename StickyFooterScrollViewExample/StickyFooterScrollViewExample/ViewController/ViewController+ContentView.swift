//
//  ViewController+ContentView.swift
//  StickyFooterScrollViewExample
//
//  Created by Nguyen, Thinh on 22/07/2022.
//

import Foundation
import UIKit
import StickyFooterScrollView

extension ViewController {
    final class ContentView: UIView {
        let scrollView = StickyFooterScrollView(minimumFooterTopOffset: 24)
        
        private let stackView = UIStackView()
        
        private let imageView = UIImageView()
        private let imageView2 = UIImageView()
        
        private let titleLabel = UILabel()
        private let descriptionLabel = UILabel()
        
        private let okButton = UIButton()
        
        init() {
            super.init(frame: .zero)
            addSubviews()
            setupSubviews()
            setupLayout()
            setupAccessibilityIdentifiers()
        }
        
        @available(*, unavailable)
        required init?(coder: NSCoder) { nil }
    }
}

extension ViewController.ContentView {
    private func addSubviews() {
        addSubview(scrollView)
        scrollView.applyContentView(stackView, with: .init(top: 24, left: 24, bottom: 24, right: 24))
        
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(descriptionLabel)
        stackView.addArrangedSubview(imageView2)
        
        scrollView.applyFooterView(okButton, with: .init(top: 24, left: 24, bottom: 24, right: 24))
    }

    private func setupSubviews() {
        backgroundColor = .white
        scrollView.translatesAutoresizingMaskIntoConstraints = false

        stackView.spacing = 24
        stackView.axis = .vertical
        
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "Image")
        
        imageView2.contentMode = .scaleAspectFit
        imageView2.image = UIImage(named: "Image-1")
    
        titleLabel.text = "Hello"
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.numberOfLines = 0
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.textColor = .red

        descriptionLabel.text = "Sticky Footer Scroll View"
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.numberOfLines = 0
        descriptionLabel.lineBreakMode = .byWordWrapping
        descriptionLabel.textColor = .blue
        
        okButton.translatesAutoresizingMaskIntoConstraints = false
        okButton.setTitle("OK", for: .normal)
        
        okButton.layer.masksToBounds = true
        okButton.layer.cornerRadius = 8
        okButton.backgroundColor = .blue
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            okButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    private func setupAccessibilityIdentifiers() {
    }
}
