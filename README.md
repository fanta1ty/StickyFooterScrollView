![LOGO](https://github.com/fanta1ty/StickyFooterScrollView/blob/master/StickyFooterScrollView/Assets/logo.png)

# StickyFooterScrollView
StickyFooterScrollView is a simple and flexible UI component fully written in Swift.

[![CI Status](https://img.shields.io/travis/thinhnguyen12389/StickyFooterScrollView.svg?style=flat)](https://travis-ci.org/thinhnguyen12389/StickyFooterScrollView)
[![Version](https://img.shields.io/cocoapods/v/StickyFooterScrollView.svg?style=flat)](https://cocoapods.org/pods/StickyFooterScrollView)
[![License](https://img.shields.io/cocoapods/l/StickyFooterScrollView.svg?style=flat)](https://cocoapods.org/pods/StickyFooterScrollView)
[![Platform](https://img.shields.io/cocoapods/p/StickyFooterScrollView.svg?style=flat)](https://cocoapods.org/pods/StickyFooterScrollView)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

StickyFooterScrollView is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'StickyFooterScrollView'
```

## Usage
```swift
import StickyFooterScrollView
```
1) Initiate ``StickyFooterScrollView``
```swift
let scrollView = StickyFooterScrollView(minimumFooterTopOffset: 24)
```

2) Add ``StickyFooterScrollView`` into parent
```swift
view.addSubview(scrollView)
```

3) Setup constraints for ``StickyFooterScrollView``
```swift
scrollView.translatesAutoresizingMaskIntoConstraints = false

NSLayoutConstraint.activate([
    scrollView.topAnchor.constraint(equalTo: view.topAnchor),
    scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
    scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
    scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
])
```

4) Setup content view and add into ``StickyFooterScrollView`` to display the main content
```swift
let mainContentView = UIStackView()
mainContentView.axis = .vertical

let imageView = UIImageView(image: UIImage(named: "Image"))
mainContentView.addArrangedSubview(imageView)

let titleLabel = UILabel()
titleLabel.text = "Hello"
titleLabel.textColor = .red
mainContentView.addArrangedSubview(titleLabel)

let descriptionLabel = UILabel()
descriptionLabel.text = "Sticky Footer Scroll View"
descriptionLabel.textColor = .blue
mainContentView.addArrangedSubview(descriptionLabel)
        
scrollView.applyContentView(mainContentView, with: .init(top: 24, left: 24, bottom: 24, right: 24))
```

5) Setup the footer view and add into ``StickyFooterScrollView`` to display the footer content
```swift
let confirmButton = UIButton()
confirmButton.setTitle("OK", for: .normal)

scrollView.applyFooterView(confirmButton, with: .init(top: 24, left: 24, bottom: 24, right: 24))
```

6) On function ``viewDidAppear``, call the function ``updateLayout`` for constraint UI
```swift
override func viewDidAppear(_ animated: Bool) {
super.viewDidAppear(animated)

contentView.scrollView.updateLayout()
}
```

![alt text](https://github.com/fanta1ty/StickyFooterScrollView/blob/master/StickyFooterScrollView/Assets/Screenshot.png)

## Author

fanta1ty, thinhnguyen12389@gmail.com

## License

StickyFooterScrollView is available under the MIT license. See the LICENSE file for more info.
