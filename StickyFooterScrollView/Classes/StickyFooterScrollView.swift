//
//  StickyFooterScrollView.swift
//  StickyFooterScrollView
//
//  Created by Nguyen, Thinh on 22/07/2022.
//

import Foundation
import UIKit

final public class StickyFooterScrollView: UIScrollView {
    
    private let contentContainerView = UIView()
    private let footerContainerView = UIView()

    var stickyViewScrollableTopConstraint: NSLayoutConstraint?
    var stickyViewNonScrollableTopConstraint: NSLayoutConstraint?
    var stickyViewNonScrollableBottomConstraint: NSLayoutConstraint?
    private let minimumFooterTopOffset: CGFloat

    public init(minimumFooterTopOffset: CGFloat = 0) {
        self.minimumFooterTopOffset = minimumFooterTopOffset
        super.init(frame: .zero)
        addSubviews()
        setupSubviews()
        setupLayout()
        setupAccessibilityIdentifiers()
    }

    @available(*, unavailable)
    required public init?(coder: NSCoder) { nil }

    // Call this method when frames are already calculated
    // eg. viewDidAppear
    public func updateLayout() {
        let contentHeight = contentSize.height
        let frameHeight = frame.size.height
        let verticalAdjustentContentInset: CGFloat = adjustedContentInset.top + adjustedContentInset.bottom
        let isScrolling = (contentHeight + verticalAdjustentContentInset) > frameHeight
        isScrollEnabled = isScrolling
        stickyViewScrollableTopConstraint?.isActive = isScrolling
        stickyViewNonScrollableTopConstraint?.isActive = !isScrolling
        stickyViewNonScrollableBottomConstraint?.isActive = !isScrolling
    }

    public func applyContentView(_ view: UIView, with insets: UIEdgeInsets) {
        apply(view, to: contentContainerView, with: insets)
    }

    public func applyFooterView(_ view: UIView, with insets: UIEdgeInsets) {
        apply(view, to: footerContainerView, with: insets)
    }

    private func apply(_ view: UIView, to container: UIView, with insets: UIEdgeInsets) {
        container.subviews.forEach {
            $0.removeFromSuperview()
        }
        view.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(view)

        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: container.topAnchor, constant: insets.top),
            view.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -insets.bottom),
            view.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: insets.left),
            view.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -insets.right)
        ])
    }
}

extension StickyFooterScrollView {

    private func addSubviews() {
        addSubview(contentContainerView)
        addSubview(footerContainerView)
    }

    private func setupSubviews() {
        footerContainerView.translatesAutoresizingMaskIntoConstraints = false
        contentContainerView.translatesAutoresizingMaskIntoConstraints = false
    }

    private func setupLayout() {
        stickyViewNonScrollableTopConstraint = footerContainerView.topAnchor
            .constraint(greaterThanOrEqualTo: contentContainerView.bottomAnchor, constant: minimumFooterTopOffset)
        stickyViewScrollableTopConstraint = footerContainerView.topAnchor
            .constraint(equalTo: contentContainerView.bottomAnchor, constant: minimumFooterTopOffset)

        stickyViewNonScrollableBottomConstraint = footerContainerView.bottomAnchor.constraint(equalTo: frameLayoutGuide.bottomAnchor)
        stickyViewNonScrollableBottomConstraint?.priority = .defaultLow

        stickyViewNonScrollableTopConstraint?.isActive = true
        stickyViewNonScrollableBottomConstraint?.isActive = true

        NSLayoutConstraint.activate([
            contentContainerView.topAnchor.constraint(equalTo: contentLayoutGuide.topAnchor),
            contentContainerView.leadingAnchor.constraint(equalTo: frameLayoutGuide.leadingAnchor),
            contentContainerView.trailingAnchor.constraint(equalTo: frameLayoutGuide.trailingAnchor),

            footerContainerView.leadingAnchor.constraint(equalTo: frameLayoutGuide.leadingAnchor),
            footerContainerView.trailingAnchor.constraint(equalTo: frameLayoutGuide.trailingAnchor),
            footerContainerView.bottomAnchor.constraint(equalTo: contentLayoutGuide.bottomAnchor)
        ])
    }

    private func setupAccessibilityIdentifiers() {
    }
}
