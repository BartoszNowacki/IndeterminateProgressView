# IndeterminateProgressView

[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
![License](https://img.shields.io/badge/licence-GPL--3.0-informational.svg)
![Platform](https://img.shields.io/badge/platform-iOS-lightgrey.svg)
![Swift](https://img.shields.io/badge/swift-5.1-orange.svg)

## Description

**IndeterminateProgressView** is extended UIProgressView, which have functionality of indeterminate progress, like in Android Progress View.

## Installation

**IndeterminateProgressView** is available through [Carthage](https://github.com/Carthage/Carthage).
To install just write into your Cartfile:

```ruby
github "BartoszNowacki/IndeterminateProgressView"
```

## Usage
**IndeterminateProgressView** have two states in which he can work: determinate and indeterminate. In determinate state progress view works as normal UIProgressView. In indetermianate state it works as Android like Progress View with indeterminate progress. Before you will use indeterminate progress view, you have to set indeterminate state. 

There are 2 ways to configure that:

1. In storyboard - Fill Progress Type filed with "indeterminate" (or "determinate") text.

2. In code:
```swift
    @IBOutlet weak var progressView: IndeterminateProgressView!
    ...
    public func setupProgressView {
      progressView.type = .indeterminate
    }
```

*Please note* that changing the type from indeterminate to determinate while animation is active it will stop the animation.

If type of your progressView is indeterminate, then you can call function to start progress animation. Use startIndeterminateProgress() and stopIndeterminateProgress() to start and stop your progress animation. 

Example:

```swift
progressView.startIndeterminateProgress()

DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
  self.progressView.stopIndeterminateProgress()
}
```

*Please note* that if you want to start of the progressView indeterminate animation, you should put startIndeterminateProgress() function in viewWillAppear.
