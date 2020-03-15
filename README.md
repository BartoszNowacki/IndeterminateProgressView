# IndeterminateProgressView

[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
![License](https://img.shields.io/badge/licence-GPL--3.0-informational.svg)
![Platform](https://img.shields.io/badge/platform-iOS-lightgrey.svg)
![Swift](https://img.shields.io/badge/swift-5.1-orange.svg)

## Description

**IndeterminateProgressView** extends UIProgressView to replicate Android’s Progress View indeterminate progress mode.

## Installation

**IndeterminateProgressView** is available through [Carthage](https://github.com/Carthage/Carthage).
To install add to your Cartfile:

```ruby
github "BartoszNowacki/IndeterminateProgressView"
```

## Usage
**IndeterminateProgressView** works in two modes:
* Determinatee - works as normal UIProgressView
* Indetermianate - works similarly to Android’s Progress View with indeterminate progress mode. To use indeterminate progress view, indeterminate state has to be set:

1. In storyboard - Fill Progress Type field with "indeterminate" (or "determinate") text.

2. In code:
```swift
    @IBOutlet weak var progressView: IndeterminateProgressView!
    ...
    public func setupProgressView {
      progressView.type = .indeterminate
    }
```

*Please note* that changing the type from indeterminate to determinate while animation is active will stop the animation.

You can start/stop progress animation with startIndeterminateProgerss() / stopIndeterminateProgress() (in indeterminate mode).

Example:

```swift
progressView.startIndeterminateProgress()

DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
  self.progressView.stopIndeterminateProgress()
}
```

*Please note* to start the progressView indeterminate animation as soon as view will appear, you should put startIndeterminateProgress() function in viewWillAppear.
